# Using the PL2303 Serial Cable on a Mac

If you've downloaded the driver from the [Prolific website](http://www.prolific.com.tw/US/ShowProduct.aspx?p_id=229&pcid=41) you might have experienced some hiccups before you got something working. If you never got it to work make sure to try getting a driver from [mac-usb-serial.com](https://www.mac-usb-serial.com/). 

At first I was averse in buying a driver that should "just" work but in hindsight, these drivers are quite hard to maintain and test across multiple platforms and up to date operating systems. The $8 cost makes sense in this scenario.

Make sure to try multiple versions of the driver from the manufacturer's website first, make sure to use kextunload to avoid conflicting drivers loaded into the kernel. 

If you think you've tried everything then it might be time to buy the premium driver. Some solutions to get the original drivers working include disabling a security configuration, if you're averse to that then just get the premium driver which are signed and won't require you to compromise any security feature.

tags: rpi
