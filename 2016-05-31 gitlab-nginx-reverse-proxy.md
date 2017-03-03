# Running Gitlab on a Pi

The code to the home made static site generator I use to build this site is now on a self-hosted public repository. Here's the link:

> [postmaster/jenny](http://git.manilafunctional.com/postmaster/jenny)

The repo and interface is of course hosted on the same server.

I'll eventually open this repository for contributions when I have email set up, for now sign ups are disabled and will likely stay that way, user accounts will be handed out by request only.

### Proxy Upgrade

The _thttpd_ server hosting the site is now behind an _nginx_ reverse proxy, this way Gitlab - the repository interface employed here - also behind the same proxy, can be served under a subdomain and in port 80.
