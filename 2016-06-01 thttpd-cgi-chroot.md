# CGI Scripts on THTTPD

You cannot have CHROOT and CGI scripts at the same time, unless you're ready to have binaries stored under the CHROOT directory. If you try, you'll get a vague 500 Internal Error message from thttpd.

Also note that by default thttpd runs as the 'nobody' user, unless you run it with the __-u__ command flag, or indicate a user in the configuration using __user=__.

In most use-cases using the nobody user is insufficient, you'll need a user in more system groups to allow better access to binaries - but don't do that for "nobody" since it's also in use by other programs.

So create a new user like _www-data_, and add that to the needed groups instead, and use the user command flag or config to tell thttpd to use this user instead.

---

This [page](http://cgi.manilafunctional.com/temp.cgi) will tell you how hot the server processor is.

tags: rpi 
