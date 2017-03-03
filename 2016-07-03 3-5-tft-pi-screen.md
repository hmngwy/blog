# Configuring the 3.5" TFT Capacitive Touch Screen

These things are cheap, all over the place, yet there's no documentation about them anywhere. For their size it's hard to find practical uses of it with X GUI. So here's how to enable them for use with the console.

Your best bet is to use a built-in driver.

Add this to your /boot/config.txt file:

    dtoverlay=piscreen,speed=16000000

Add this to your /boot/cmdline.txt file, add this to the end of the only line:

    fbcon=map:10 fbcon=rotate:2 fbcon=font:ProFont6x11

Now reboot your Pi. If the screen changes from black to white, your changes in config.txt file is correct. If you start seeing the console, then your cmdline.txt changes are correct.


tags: rpi debian
