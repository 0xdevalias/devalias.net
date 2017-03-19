---
layout: post
title: "iTerm2 + tmux = <3"
tags:
- quicknote
- productivity
- iterm2
- tmux
- screen
- terminal
- ssh
- osx
- macos
- starkandwayne.com
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
Just a quick note today, highlighting a super simple but amazingly useful combination I've only recently become aware of: [iTerm2](https://www.iterm2.com/) + [tmux](https://tmux.github.io/).

If you don't know what these are:

* iTerm2 is a terminal emulator for macOS
* tmux is terminal multiplexer, allowing you to run multiple programs in the same terminal session

If you use SSH a lot, you know the benefits of using something like tmux (or [screen](https://www.gnu.org/software/screen/manual/screen.html) for you older folks..) to run multiple programs at once, or keep them running when you disconnect.

While this is definitely a nice feature, I've always found the command syntax and interface to be just a little too confusing (growing up in a GUI world..), and so I tend to end up resorting to opening multiple SSH connections or similar hacks. That way I can use the multiple tabs/windows I get from iTerm2 instead.

Hacks no more! Thanks to the little known [iTerm2 tmux integration](https://gitlab.com/gnachman/iterm2/wikis/TmuxIntegration), we can get the benefits of tmux, and the ease of iTerm's tabs and windows. It works seamlessly. When using iTerm2:

You can create a new tmux session with:

```
tmux -CC
```

Or reattach to a previous session with:

```
tmux -CC attach
```

This will open a new window running the tmux session. From there, we can open new tabs (`command-t`), or split the tab vertically (`command-shift-d`) or horizontally (`command-d`)

For a more information, you could checkout [iTerm and Tmux, sitting in a tree](http://www.starkandwayne.com/blog/iterm-and-tmux-sitting-in-a-tree/) by Jamie van Dyke.

{% comment %}{% twitter https://twitter.com/_devalias/status/842840388922626048 %}{% endcomment %}
