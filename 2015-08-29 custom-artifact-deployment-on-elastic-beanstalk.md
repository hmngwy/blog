---
colophon:
  location: Sta. Rosa PH
---

Code {label}

# Custom Artifact Deployment on Elastic Beanstalk

Deploying VCS ignored code to AWS Elastic Beanstalk. {lede}

Lilii, the site I run this blog from, uses a build script for deployment, the build script does basic stuff like compiling assets and updating references in the templates. The updated templates are housed in a folder that is read from when the app runs in production. This build directory doesn't belong in Git so I have it in my `.gitignore`. The problem with this is that when using Git with EB CLI, the deploy subcommand uses `git archive`     to prepare the artifact it uploads to S3 for deployment. And so ignored files and folders are not included in this archive, thus my built templates are not included in the deployed code. {excerpt intro emphasize}

Fortunately there's a way to tell the CLI to collect the artifact from another location. In your `.elasticbeanstalk/config.yml` file you will have to add: 

```yml
deploy:
  artifact: "path/to/archive.zip"
```

With this we can generate our own artifact/zip file at the tail of our build scripts and place it in the specified path in our config.

##### Three things that are undocumented here {align-center letter-space-2}

First, the _path does not need to be absolute (1)_, documentation and an AWS employee in the forums indicated the paths should be absolute. I found that relative paths work. {dropcap}

You will still have to _commit before deploying (2)_, this is because even though you named your artifact/zip file, EB CLI will still use the first few letters of `git rev-parse --short HEAD` to rename it. If you don't commit, EB CLI will see the current commit HEAD matches the last deploy, it will not upload your zip file, and instead will use the last upload straight from S3 to re-deploy.

Lastly, unfortunately this features is not verbose, _you will not be notified it is using your artifact (3)_, the fact that it uses the commit hash to rename your artifact makes it seem like `git archive` is still in use. The only way to find out if your artifact is used in deployment is to use `--debug` and watch out for mentions of your artifact path, like: 

```json
{
  'Body': <open file 'path/to/artifact.zip', mode 'rb' at 0x000FFF000>, 
  'Bucket': 'elasticbeanstalk-us-east-0-0000000000',
  'Key': 'projectroot/1a2b.zip'
}
```

---

###### Update 16 September 2015. 

Since I initially published this article, I have started using `grunt-eb-deploy`, because my deployment artifact became a  bit more complicated after I added `grunt-usemin` for optimization, and LESS support for CSS. This module can take care of compressing a build folder after all your grunt tasks, it uses the AWS SDK directly and so with it a commit is not necessary before deploying.