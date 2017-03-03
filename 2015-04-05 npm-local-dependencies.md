# NPM LOCAL DEPENDENCIES

Ever set out to write a blog entry, then half way through you preview your work, and you realize that your site is somewhat broken? Yep. I spent the better part of yesterday figuring out how to get a local dependency working on Lilii.

A dependency for Lilii was updated a week ago that doesn't work with the latest of its peer dependencies. But the developer had created a branch that does. Simply enough I unbuilt that package with _npm remove_ and then did an _npm install user/package#branch_ to get the good branch. This worked wonderfully until I needed to deploy to ElasticBeanstalk. I did, and got an error message that a peer dependency was not being met, as if it had not been instructed to fetch the branch from Github. 

Instead of fetching from Github it seems to be fetching its "latest" from NPMJS, which is not the expected behavior. So it sees the old peer dependency requirement and fails. I did not have time to figure this out because my site is now down at this point and I need a patch ASAP.

### TL;DR
Broke my site, need an emergency patch to fix an npm dependency that couldn't be fetched from Github or NPMJS.

### NPM Link
First thing that comes to mind to fix this is cloning the branch of the package and then do an _npm link_ but the problem with npm link is that some deployment systems don’t have access to sudo this command which is required to get it rolling, also if you are working on ElasticBeanstalk or Heroku you will need additional pre-install scripts to have the link run before npm install, if the deployment runs as or can run sudo. I didn't want to do this as this would mean messing with the ELB hooks again, which is a messy affair as its not easily reversible and not worth the effort for such a temporary fix. 

### Local Dependencies

Fortunately, npm supports loading packages by local path. That is, instead of defining a version in _package.json_ you define a path. 

```
  "package": "file:./path/to/package"
```

This loads the package directly from where it sits instead of a symbolic link under the global directory. 

I copied the good branch into a local folder inside the project. Added it to package.json like above, commit to git. Then deployed. 

I'm now just waiting for the developer to push the good branch back into NPMJS, so I can go back to fetching that dependency from there. Meanwhile this temporary fix does the trick. 

It looks like this was a long standing [feature request](https://github.com/npm/npm/issues/1558) for 3 years, that was resolved for almost the same reasons I found above, just about half a year ago. Pretty sure I would still be trying to figure out install hooks on ELB without it.  