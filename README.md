# speak-ip

A simple service that speaks the LAN IP address of a Raspberry Pi. It does this over and over forever, every 30 seconds.

Of course, if you wish to hear the speech, you will need to plug in some earphones/headphones or if you have configured your Raspberry Pi to use only the HDMI for audio output, then you will need to connect an HDMI cable to something that can emit audio.

This little example uses the default English `espeak` voice for this (which is pretty horrible), and sends it a text string that looks similar to this:

```
Your eye pee address is 1 9 2 dot 1 6 8 dot 1 dot 1 2 3
```

The `espeak` tool can pronounce many other languages, so hack away if you want that. Here is some documentation:
   [http://espeak.sourceforge.net/docindex.html](http://espeak.sourceforge.net/docindex.html)

By default it only looks at the `wlan0` interface. If yu plan to use a wired connection then edit the Makefile to specify `eth0` as the `INTERFACE_NAME`.

Of course, specifying the `INTERFACE_NAME` is inconvenient. You could do something better, like determine the hosts's "default route" and then find the host interface that was on that network, and then announce the IP address of that interface. If you did that, then then you would not need to pass any `INTERFACE_NAME` at all. But I was tooo lazy to code that! :-)

