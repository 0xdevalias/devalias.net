---
layout: post
title: Plesk - Adding programs to a chrooted SSH
date: '2012-01-10T04:29:00+10:00'
tags:
- chroot
- git
- plesk
- ssh
- bin
- chrootmng
- files
- ftp
- execv
- bash
- failed
categories:
- devalias
tumblr_url: http://devalias.tumblr.com/post/15535429513/plesk-adding-programs-to-a-chrooted-ssh
redirect_from: /post/15535429513/plesk-adding-programs-to-a-chrooted-ssh
---
Just a few notes today about making programs (in this case git) available to a chrooted SSH account in Plesk. I'm assuming the account is already setup for ssh, etc so I will just be covering where to copy the files to.

**Note:** If you are here about getting an `execv("/bin/bash")` failed error, check Appendix B

## Location

* `/usr/local/bin` - The git bin files we will be copying.
* `/usr/local/share/git-core` - The shared git-core files.
* `/var/www/vhosts/chroot` - The base directory for chroot accessible programs.

## Copying Git

Firstly you will want to locate the git files. The easiest way to do this is by typing:

```
which git
```

This should tell you the path to git (in my case /usr/local/bin) Next we want to copy the files over to the equivalent path in the chroot directory (/path/to/chroot/usr/local/bin)

```
cp -R /usr/local/bin/git* /var/www/vhosts/chroot/usr/local/bin
```

In the case of git, we also want to copy over some other files

```
cp -R /usr/local/share/git-core /var/www/vhosts/chroot/usr/local/share/git-core
cp -R /usr/local/libexec /var/www/vhosts/chroot/usr/local/libexec/git-core
```

**Note:** The libexec files are quite large (100's of mb) so you may want to consider doing this in a better way.

## Updating chroot'd directories

The final (rather simple) step involves updating any chrooted directories that have already been created. This can be done by running the `recreate_chroot_env.sh` script (downloadable from http://kb.parallels.com/818)

This can also be done without the script:

``
/usr/local/psa/admin/sbin/chrootmng --remove --source=/var/www/vhosts/chroot --target=/var/www/vhosts/<domain name>
/usr/local/psa/admin/sbin/chrootmng --create --source=/var/www/vhosts/chroot --target=/var/www/vhosts/<domain name>
```

**Thats it!!**

Now when you login to your chrooted account you should be able to use git. I might add the required files for some more programs as I find the need to add them.

## Appendix A: Files required for ftp

* `/usr/bin/ftp` -> `chroot/bin`
* `/usr/lib64/libreadline.so.5` -> `chroot/lib/libreadline.so.5`
* `/usr/lib64/libncurses.so.5` -> `chroot/lib/libncurses.so.5`
* `/etc/services` -> `chroot/etc/services`

## Appendix B: execv("/bin/bash") failed

One cause of this occuring is due to the bin files for a chrooted directory not exisiting/being properly setup. This can be fixed by following the instructions in Updating chroot'd directories above.. or if you're too lazy to scroll (like me)

```
/usr/local/psa/admin/sbin/chrootmng --remove --source=/var/www/vhosts/chroot --target=/var/www/vhosts/<domain name>
/usr/local/psa/admin/sbin/chrootmng --create --source=/var/www/vhosts/chroot --target=/var/www/vhosts/<domain name>
```