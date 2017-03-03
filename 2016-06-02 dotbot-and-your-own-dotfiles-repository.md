# Getting Started with a Dotfiles Repository

I realized I move from one machine to another too frequently. I have this server, which aside from hosting this site from, I actually directly write and work on. I have a couple other machines, one stationary and one mobile. And a few dumb terminals, i.e. my phones that shell into either of the three more capable computers. 

Quite tired of the inconsistent terminal experience and my shoddy Dropbox solution, I've decided to check in my dotfiles to a repository so I can sync it across multiple machines. 

The idea is simple, and not my own of course.

1. Check in all your dotfiles into one repository
2. In that repository is a tool that will automatically symlink the dotfiles into your home folder

The process of syncing should be quick. Clone the repo, and run the tool.

I didn't find a condensed version of getting started with a dotfiles repo out there, so I thought I would write one.

First we create the directory and start a git repository.

    $ mkdir .dotfiles && cd .dotfiles
    $ git init

Next we add the tool that handles the symlinks, the only one I've tried is dotbot, it looks promising and is a good start.

    $ git submodule add https://github.com/anishathalye/dotbot
    $ cp dotbot/tools/git-submodule/install .
    $ git commit -am 'adds symlink tool submodule'

Now we add a remote and push, because this is all pointless if you can't sync it across multiple machines. 

    $ git remote add origin git@github.com:username/dotfiles.git
    $ git push -u origin master

Even though you will be the only one to work on this repository, it will be good practice to separate work on different dotfiles on different branches. For example if you want to add your vim related files. 

    $ git checkout -b application/vim

Add files, commit, and for the first push do:

    $ git push -u origin application/vim

Once you've copied or moved all the dotfiles related to the branch, you can merge it back to master. 

    $ git checkout master
    $ git merge application/vim
    $ git push origin master

This merges your changes for vim into the master branch, and pushes the merge into the remote, this way both remote and local are now synced. 

---

This is where I push my dotfiles: [postmaster/dotfiles](http://git.manilafunctional.com/postmaster/dotfiles)
