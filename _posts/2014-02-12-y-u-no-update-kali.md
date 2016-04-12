---
layout: post
title: Y U NO Update Kali?
date: '2014-02-12T15:00:41-07:00'
tags:
- kali
- apt-get
- sources.list
- pentest
- hack
- update
- repo
- source
- bleeding-edge
- deb
- debian
- apt
- setup
tumblr_url: http://devalias.tumblr.com/post/76393663831/y-u-no-update-kali
redirect_from: /post/76393663831/y-u-no-update-kali
---
![Kali Linux Y U No Update](http://33.media.tumblr.com/14488aeff06565e138562d10282a1e1b/tumblr_inline_n0tm4bm9eX1qj2l0u.jpg)

Not too long ago I was setting up a new pentest machine with Kali. Fairly straightforward a task, though slightly inconvenienced by the fact that the net was down at the time. No matter I thought, continue offline and all should be fine.. apparently not.

When you don't have a live net connection during setup Kali decides not to fill in the server details needed by apt-get to pull down anything more than security updates (no new tools for you!) Thankfully this is a simple and quick fix.

## But how?

Having a look over at the [Kali documentation](http://docs.kali.org/general-use/kali-linux-sources-list-repositories) we find the instructions and url's required. Basically we just have to..

* Edit `/etc/apt/sources.list`
* Add or ensure the following lines are present:

### For general Kali repositories (aka everyone)

```
deb http://http.kali.org/kali kali main non-free contrib
deb http://security.kali.org/kali-security kali/updates main contrib non-free
```

### To use the source (aka Jedi's)

```
deb-src http://http.kali.org/kali kali main non-free contrib
deb-src http://security.kali.org/kali-security kali/updates main contrib non-free
```

### And finally for those who like to live (and bleed) on the edge

```
deb http://repo.kali.org/kali kali-bleeding-edge main
#deb-src http://repo.kali.org/kali kali-bleeding-edge main
```

## Now we update!

Once this is done (and saved) we can just do our standard

```
apt-get update && apt-get upgrade
```

or

```
apt-get update && apt-get upgrade
```

Happy (ethical) hacking!
