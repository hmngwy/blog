# I guess I like Docker now?

You can now run `jenny` without installing a thing, use it through the alias below:

```
alias jenny='docker run -it -v $PWD:/blog jenny:latest'
```

This is great cause this means I don't have to install `jenny` on every machine that I own. Also this means I could wrap it in a Github Action, and use it in a build Workflow on my blog repo [like so](https://github.com/marketplace/actions/jenny-blog):

```
- name: jenny-blog
  uses: hmngwy/jenny@v1.2.0
```

This project was due some updates, but didn't think this would be it. Pretty neat finally turning around and embracing Docker in freaking 2021.

tags: jenny
