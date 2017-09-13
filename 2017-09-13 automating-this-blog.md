# Every Static Site Workflow Ever

Except mine runs my own blog generator. 

### Editing

iA Writer > [TIG](TIG - Git Client by Seokhyeon Nam
https://itunes.apple.com/us/app/tig-git-client/id1161732225?mt=8) [^1]

I prefer writing in iA Writer on the iPad, it's simple, it's multimarkdown, and I've had it since version 1 on an iPhone 4s. 

### Publishing

The strategy is simple, and common. Push to a repo, TravisCI picks up the tag, runs the build instructions which has a step to clone my generator, `jenny`, and run it against a clone of the blog source repo, and then finally push to `gh-pages` branch.

So here's the travis config to automate the generate a `jenny` blog.

```yaml
language: bash

before_install:
  - sudo apt-get -qq update
  - git clone https://github.com/fletcher/MultiMarkdown-6.git mmd
  - (cd mmd && make release && cd build && make && sudo make install)
  - git clone https://github.com/hmngwy/jenny.git jenny
  - (cd jenny; sudo make install)
  - mkdir .dist

script:
  - jenny

deploy:
  fqdn: manilafunctional.com
  provider: pages
  local_dir: .dist
  skip_cleanup: true
  github_token: $GITHUB_TOKEN
  target_branch: gh-pages
  on:
    branch: master
```


[^1]: I've tried Git2Go, iOS Locations don't work, and the last update was last May. Also tried Working Copy, but the UI is just embarrassing to use around designers, and such a pain to use.