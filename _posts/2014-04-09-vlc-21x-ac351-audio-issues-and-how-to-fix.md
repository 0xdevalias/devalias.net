---
layout: post
title: VLC 2.1.x AC3/5.1 Audio Issues (and how to fix them)
date: '2014-04-09T10:01:22-07:00'
tags:
- vlc
- audio issues
- '5.1'
- ac3
- problem
- error
- 2.1.x
- 2.1.0
- 2.1.1
- 2.1.2
- 2.1.3
- videolan
tumblr_url: http://blog.devalias.net/post/82140747557/vlc-21x-ac351-audio-issues-and-how-to-fix
---
So, just lost an hour or two debugging some audio issues that seemed to crop up in VLC. I have a 5.1 setup, which will disable the speakers when I plug in a 2-channel set of headphones (pretty straightforward). For some strange reason this stopped working sometime recently. I assumed maybe audio drivers (windows update) or something else weird like that, but turns out it was VLC (which I forgot I had upgraded)

Old versions of VLC (pre 2.1.x) allowed you to ‘force’ a downscale in situations like this through the rAudio -> Audio Device -> Stereo right click menu option. Turns out, this feature was removed (and the menu item repurposed) in VLC 2.1.x. According to  Jean-Baptiste Kempf on the VLC forums this feature won’t be coming back anytime before 2.2.x

So what do we do in the meantime? If you haven’t upgraded to 2.1.x yet and need this feature then don’t upgrade. If you already have, downgrade to 2.0.8 (Windows) or 2.0.9 (OSX/Linux)

2.0.8 Win32 (EXE, ZIP)
2.0.8 Win64 (EXE, ZIP)
2.0.9 OSX (DMG)
2.0.9 Linux (XZ)
Hope this saves you guys some time and effort!!
