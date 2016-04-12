---
layout: post
title: Yum'my turtles breaking Plesk
date: '2012-03-28T09:30:00-07:00'
tags:
- plesk
- yum
- mysql
- upgrade
- error
- mediatemple
tumblr_url: http://devalias.tumblr.com/post/20028664762/yummy-turtles-breaking-plesk
redirect_from: /post/20028664762/yummy-turtles-breaking-plesk
---
After some recent downtime due to an overzealous upgrade cycle (aka "Oh I won't need to backup first..") I feel it warranted to put a quick post about how I went about fixing things.

## How the problem started

It started off with me deciding to add a 3rd party repos by Atomic Rocket Turtle to yum (without really doing much research into things) I proceeded to upgrade my packages, and go on with life as normal (or so I thought)

A few days later I decided I should probably also upgrade Plesk to the latest version as well. Most of the upgrade process went through, but then ended up crashing out near the end.

Adding to the reasons why I love Plesk, it created some log files for me as in the process of dying:

* /tmp/plesk_10.4.4_installation.log
* /tmp/plesk_10.4.4_installation_problems.log

Taking a look at the `intallation_problems.log`, I got my first glimpse into what went wrong:

```
START Bootstrapper 10.13.4 post-install for BASE AT Sun Mar 25 12:05:38 EST 2012
*****  problem report *****
ERROR while trying to establish test connection to APS database via ODBC
Check the error reason(see log file: /tmp/plesk_10.4.4_installation.log), fix and try again
STOP Bootstrapper 10.13.4 post-install for BASE AT Sun Mar 25 12:05:46 EST 2012: PROBLEMS FOUND
START Bootstrapper 10.13.4 repair AT Sun Mar 25 12:14:15 EST 2012
*****  problem report *****
ERROR while trying to establish test connection to APS database via ODBC
Check the error reason(see log file: /tmp/plesk_10.4.4_installation.log), fix and try again
STOP Bootstrapper 10.13.4 repair AT Sun Mar 25 12:14:29 EST 2012: PROBLEMS FOUND
```

A little cryptic, but after googling around for a while I discovered that it was likely due to an incompatible version of MySQL.

## So to fix it..

We will just back out the upgrades we did the other day, all good! Well, it took some time, a hell of a lot of reading/research and some blind faith, but I did get there in the end.

## Prerequisite?

I'm not actually sure if it's used or not in this process, but I should note that I had yum-allowdowngrade installed prior to this process

`yum install yum-allowdowngrade`

# tl;dr

1. Install/configure yum-priorities
2. Set up a few more yum repositories (EPEL, Remi)
3. Remove and reinstall the packages (yum shell)
4. Finish the Plesk upgrade (bootstrap.sh)

## 1. Install/configure yum-priorities ([Webpage](https://wiki.centos.org/PackageManagement/Yum/Priorities), [Reference](http://dev.antoinesolutions.com/yum-priorities))

The yum-priorities plugin enforces ordered protection of repositories (aka help prevent screwups) Here's a quick rundown (more info at the reference/webpage links)
It's pretty easy to install

`yum install yum-priorities`

Ensure the following lines exist in the yum-priorities configuration file (`/etc/yum/pluginconf.d/priorities.conf`)

```
[main]
enabled=1
```

Open the CentOS base repository configuration file (`/etc/yum.repos.d/CentOS-Base.repo`)

Add the following text to the end of the Base, Updates, Addons, and Extras repository entries

```
priority=1
```

Add the following text to the end of the CentOSPlus repository entry

```
priority=2
```

## 2. Set up additional yum repositories ([EPEL Website](https://fedoraproject.org/wiki/EPEL/FAQ#What_is_EPEL.3F), [EPEL Download](http://mirror.sfo12.us.leaseweb.net/epel/), [EPEL Reference](http://dev.antoinesolutions.com/epel-repository), [Remi Website](http://blog.famillecollet.com/pages/Config-en), [Remi Reference](http://dev.antoinesolutions.com/remi-repository))

Next I needed to add a few extra repositories (EPEL and Remi) to yum so it could find the packages it needed (you may need to run this as root)

```
rpm -Uvh http://mirror.iprimus.com.au/epel//5/i386/epel-release-5-4.noarch.rpm
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
```

## 3. Remove/reinstall the updated packages

This perplexed me a little bit at first, as when I tried to remove a package it wanted to uninstall everything else. Then I realised yum has a shell/batch mode.

`yum shell`

Once in the yum shell, I disabled the Atomic repository

`repo disable atomic`

And then queued up the packages to be changed. With the Atomic repos disabled the install pulled the packages from the correct (aka base) repositories.

```
erase atomic-release.noarch libedit.x86_64 libsepol.i386 libsepol.x86_64 libsepol-devel.x86_64
install atomic-release.noarch libedit.x86_64 libsepol.i386 libsepol.x86_64 libsepol-devel.x86_64
erase php-cli.x86_64 php-common.x86_64 php-devel.x86_64 php-gd.x86_64 php-imap.x86_64 php-ldap.x86_64 php-mbstring.x86_64 php-mcrypt.x86_64 php-mysql.x86_64 php-odbc.x86_64 php-pdo.x86_64 php-snmp.x86_64 php-xml.x86_64 php-xmlrpc.x86_64
install php-cli.x86_64 php-common.x86_64 php-devel.x86_64 php-gd.x86_64 php-imap.x86_64 php-ldap.x86_64 php-mbstring.x86_64 php-mcrypt.x86_64 php-mysql.x86_64 php-odbc.x86_64 php-pdo.x86_64 php-snmp.x86_64 php-xml.x86_64 php-xmlrpc.x86_64
erase mysql.x86_64 mysql-bench.x86_64 mysql-devel.x86_64 mysql-libs.x86_64 mysql-server.x86_64 mysqlclient15.x86_64
install mysql.x86_64 mysql-bench.x86_64 mysql-devel.x86_64 mysql-libs.x86_64 mysql-server.x86_64 mysqlclient15.x86_64
```

There were also a few packages that I didn't end up reverting, but I will list them here in case I decide I need to later on.

```
erase perl-Archive-Tar.noarch perl-Email-Date-Format.noarch perl-Error.noarch perl-IO-Socket-INET6.noarch perl-MIME-Lite.noarch perl-MIME-Types.noarch
install perl-Archive-Tar.noarch perl-Email-Date-Format.noarch perl-Error.noarch perl-IO-Socket-INET6.noarch perl-MIME-Lite.noarch perl-MIME-Types.noarch
erase psa-atmail.noarch psa-proftpd.x86_64 spamassassin.x86_64 sqlite.i386 sqlite.x86_64 sqlite-devel.x86_64 t1lib.x86_64
install psa-atmail.noarch psa-proftpd.x86_64 spamassassin.x86_64 sqlite.i386 sqlite.x86_64 sqlite-devel.x86_64 t1lib.x86_64
```

## 4. Finish the Plesk upgrade

At this point I figured it was safe to try and finish the Plesk upgrade. Thanks to [some info](https://mediatemple.net/community/products/dv/204645040/how-do-i-upgrade-plesk) I found, I knew that I was going to need to run the bootstrapper.sh script. 

`cd /usr/local/psa/bootstrapper`

Depending on what version you were installing, this next location may be different, but for me it was

`cd pp10.13.4-bootstrapper`

Then run the shell script, and hope it works out!

`bootstrapper.sh`

## Done!

At this point we can just forget about that little issue, and pretend nothing ever happened..
