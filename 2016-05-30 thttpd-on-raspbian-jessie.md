# thttpd on Raspbian Jessie

First compiling and installing `thttpd` on raspbian.

	cd ~
	wget http://www.acme.com/software/thttpd/thttpd-2.27.tar.gz
	tar -zxvf thttpd-2.27.tar.gz
	cd thttpd-2.27/
	./configure
	make
	sudo addgroup --system www
	sudo mkdir /usr/local/man/man1
	sudo make install
	cd ~

You'll want to test your setup. 

	mkdir www
	echo "Hello World"  > www/index.html
	sudo thttpd -d ~/www

The last command should exit cleanly, navigate your browser to [raspberrypi.local](http://raspberrypi.local), you should see your message there.

## Now let's create a startup script

	cd ~
	mkdir .thttpd && cd .thttpd
	vim start.sh

Enter the below as the contents for start.sh:

	#!/bin/sh
	if [ -x /usr/local/sbin/thttpdwrapper ] ; then
	    echo -n " thttpd"
	    /usr/local/sbin/thttpdwrapper &
	fi

Then create the thttpdwrapper file:

	vim /usr/local/sbin/thttpdwrapper

Contents are:

	#!/bin/sh
	while true ; do
	    /usr/local/sbin/thttpd -D -C /home/pi/.thttpd/thttpdconfig
	    sleep 5
	done

Make sure it is executable:

	sudo chmod +x /usr/local/sbin/thttpdwrapper

Now let's make a config file:

	echo "dir=/home/pi/www/html" > /home/pi/.thttpd/thttpdconfig

Finally add execution of the start.sh file in your bootup scripts:

	vim /etc/rc.local

And add the below before the 'exit 0;' line

	sh /home/pi/.thttpd/start.sh

tags: rpi
