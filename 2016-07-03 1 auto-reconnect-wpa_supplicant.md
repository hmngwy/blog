# Automatically Reconnect WLAN configured with WPA\_SUPPLICANT

Usual suspect solutions involve checking ifconfig, the forcing ifup if the interface is down. But this doesn't usually work, especially if you're running your interface with wpa\_supplicant. Fortunately wpa\_supplicant provides a script to reconnect configured interfaces. You'll just have to run this script when an interface is unconfigured, and for that we use ifplugd.

Simply copy said script to ifplugd's autoloaded scripts.

    sudo cp /etc/wpa_supplicant/ifupdown.sh ./ifupdown

Then reboot your device.

tags: rpi debian
