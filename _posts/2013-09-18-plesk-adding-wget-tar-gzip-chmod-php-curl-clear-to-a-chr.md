---
layout: post
title: Plesk - Adding wget/tar/gzip/chmod/php/curl/clear to a chrooted SSH
date: '2013-09-18T15:00:00-07:00'
tags:
- plesk
- chroot
- ssh
- wget
- tar
- gzip
- chmod
- libssl.so.6
- chrootmng
- ldd
- chroot_update.sh
- php
- curl
- clear
- tldr
tumblr_url: http://devalias.tumblr.com/post/61566531090/plesk-adding-wget-tar-gzip-chmod-php-curl-clear-to-a-chr
redirect_from: /post/61566531090/plesk-adding-wget-tar-gzip-chmod-php-curl-clear-to-a-chr
---
(**tl;dr** How to setup wget, tar, gzip, chmod, php and curl in a chrooted environment for Plesk.)

So those of you that have been around for a while (or read back through the archive) will know that a while ago I posted [Plesk - Adding programs to a chrooted SSH](/post/15535429513/plesk-adding-programs-to-a-chrooted-ssh), giving a few hints and tips about configuring a chrooted environment in Plesk.

Today I bring you a few more little tidbits to help you out with adding *wget, tar, gzip and chmod* to your Plesk chroot'd environment. I followed these steps recently in helping a client get their new site up and running.

**Edit:** So it turns out Parallels has an [updated script called chroot_update.sh](http://kb.odin.com/en/115842) which makes this even easier again (yay for easy!) So I will show you how do use that for PHP and curl (at the bottom).

## Using chroot_update.sh

Adding programs to chroot is made MUCH easier now with the [chroot_update.sh](http://kb.odin.com/en/115842) script from Parallels.

To setup/update the initial chroot environment

```
./chroot_update.sh --update
```

To add a new program (and it's dependent shared libraries)

```
./chroot_update.sh --add /path/to/programname
```

or

```
./chroot_update.sh --add `which programname`
```

Then to update each sites individual chroot folder

```
./chroot_update.sh --apply all
```

If you find there are some missing shared objects, figure out which ones are missing using ldd and copy them in to the chroot folder

```
ldd /path/to/programname
cp /path/to/missingobject chroot/path/to/missingobject
./chroot_update.sh --apply all
```

## Wget

[Wget](https://www.gnu.org/software/wget/) is an awesome little program for downloading files off the net. For anyone who has ever setup an install of some 3rd party program and had to individually upload each and every file, this is a lifesaver!

To find out where the wget executable is

```
which wget
```

To check if it has any dependancies

```
ldd `which wget`
```

This will probably give you a whole list of things, but it seems the only one we really need to worry about (at least that I did) was *libssl.so.6*. So we copy both it and the executable to the chroot template folder

```
cp `which wget` /var/www/vhosts/chroot/bin
cp /lib64/libssl.so.6 /var/www/vhosts/chroot/lib64
```

And it's done! To update any sites already generated, checkout the [original article](/post/15535429513/plesk-adding-programs-to-a-chrooted-ssh)

## Tar

[Tar](https://www.gnu.org/software/tar/) is the defacto standard for archiving/unarchiving files on *nix, so.. it's pretty useful.

To find out where the tar executable is

```
which tar
```

To check if it has any dependancies

```
ldd `which tar`
```

In my case, nothing needed here, so let's just copy the executable

```
cp `which tar` /var/www/vhosts/chroot/bin
```

Done! Same as before, to update any sites already generated, checkout the [original article](/post/15535429513/plesk-adding-programs-to-a-chrooted-ssh)

## Gzip

[Gzip](http://www.gzip.org/) let's you open gzip compressed files (funnily enough) It's also what `tar` calls when you tell it to extract a `.tar.gz` file.

To find out where the gzip executable is

```
which gzip
```

To check if it has any dependancies

```
ldd `which gzip`
```

In my case, nothing needed here, so let's just copy the executable

```
cp `which gzip` /var/www/vhosts/chroot/bin
```

Done! Same as before, to update any sites already generated, checkout the [original article](/post/15535429513/plesk-adding-programs-to-a-chrooted-ssh)

## Chmod

[Chmod](https://en.wikipedia.org/wiki/Chmod) let's you change permissions on files, kinda useful to be able to do.

To find out where the chmod executable is

```
which chmod
```

To check if it has any dependancies

```
ldd `which chmod`
```

In my case, nothing needed here, so let's just copy the executable

```
cp `which chmod` /var/www/vhosts/chroot/bin
```

Done! Same as before, to update any sites already generated, checkout the [original article](/post/15535429513/plesk-adding-programs-to-a-chrooted-ssh)

## PHP

Sticking to the `chroot_update.sh` method, installing php is easier than it would otherwise be, but there are still quite a few manual steps due to the dependencies of some of the shared libraries.

```
./chroot_update.sh --add `which php`
cp -R /usr/lib64/php chroot/usr/lib64
./chroot_update.sh --add /usr/lib64/php/modules/gd.so
./chroot_update.sh --add /usr/lib64/php/modules/imap.so
./chroot_update.sh --add /usr/lib64/php/modules/mysql.so
./chroot_update.sh --add /usr/lib64/php/modules/pdo_mysql.so
./chroot_update.sh --add /usr/lib64/php/modules/pdo_sqlite.so
./chroot_update.sh --add /usr/lib64/php/modules/xsl.so
cp -R /usr/lib64/mysql/ chroot/usr/lib64
cp -R /etc/php.d chroot/etc
cp /etc/localtime chroot/etc/
cp -R /usr/share/zoneinfo chroot/usr/share/
./chroot_update.sh --apply all
``

Your mileage my vary depending on what modules you have installed, but the method is the same as above for other files. You may need to play around with some php.ini type settings to get things working, but it should be relatively straightforward.

## Curl

Sticking to the `chroot_update.sh` method, installing curl is really simple

```
./chroot_update.sh --add `which curl`
./chroot_update.sh --apply all
```

## Clear

Sticking to the `chroot_update.sh` method, installing clear is really simple

```
./chroot_update.sh --add `which clear`
./chroot_update.sh --apply all
```