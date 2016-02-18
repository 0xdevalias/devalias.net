---
layout: post
title: 'Thecus NAS: /dev/alias says no!'
date: '2013-11-27T21:52:31-07:00'
tags:
- thecus
- nas
- 'no'
- RAID
tumblr_url: http://blog.devalias.net/post/68253449830/thecus-nas-devalias-says-no
---
Spent the day today digging around in the deepest and darkest parts of my Thecus NAS, and I can now say absolutely and without a doubt not to waste your money on them.

The filesystem is horrendous, the scripts are hacked together, and it’s overall just really quite disgusting for what is meant to be a SMB/Business grade device.

I also have some serious concerns about the validity of the encryption it makes use of (‘backing up’ the encryption keyfile and password, encrypted with a static key.. pssht, no thanks) Not to mention that the ''bin’ config backup file is just a .tar.gz encrypted with, yet again, a static key.

And for funsies, there are a few things that i’ve seen along the way that I would think are exploitable, at least potentially so. Haven’t really had the time/effort/inclination to delve into it further at this stage.

This is all on top of the fact that support has been HORRENDOUS (I basically have to open a new ticket each time I reply, just to get them to look at my original ticket/attempt to do something)

In positive news.. has been interesting to say the least, and I’m pretty sure I have all the components i’ll require to string my RAID back together into some form of working state. Just a matter of figuring out just how to fit them together..

I might follow this post up in the future with some interesting findings, recovery steps, exploits or otherwise. Till then!
