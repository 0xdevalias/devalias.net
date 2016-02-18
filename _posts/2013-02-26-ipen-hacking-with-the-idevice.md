---
layout: post
title: 'iPen: Hacking with the iDevice (Setting up your iPhone as a Penetration Tester)'
date: '2013-02-26T18:45:00-07:00'
tags:
- http://blog.nickmpetty.com/?p=252
- nickmpetty
- pentesting
- iPhone
- ipod
- ipad
- jailbreak
- jailbreaking
- pentest
- hack
- metasploit
- nikto2
- nmap
- penetration testing
- social engineering toolkit
- social engineering
- set
- ettercap
- aircrack
- aircrack-ng
- nicholas petty
- nicholas
- petty
tumblr_url: http://blog.devalias.net/post/44051421215/ipen-hacking-with-the-idevice
---
Today I finally got around to the task i’ve been looking forward to for the last week or so. We got an iPad to play around with at work, mostly so we can try and break the mobile apps before they go public. Not a huge amount you can do on it in it’s default state, so I got to jailbreak it!
I won’t go into the specifics of that now though (keep an eye out for another post soon) 
In googling around for information on what the best tools/setup for pentesting with an iDevice were I came across a hackaday article titled Make iPhone a penetration testing tool. Perfect! Well.. almost. It turns out it just makes reference to a different article written a few years ago by Nicholas M. Petty. Unfortunately his old domain is now happily serving up some advertising type spam. Even though the information is a little dated, I (after tracking it down myself) decided to make it easier for everyone else to find.
The following is the original article text, as written by Nicholas M. Petty back in 2010

Introduction
(now featured on hackaday.com, thanks guys!)
There are many articles and presentations about the concept of using an iPhone or iPod Touch as a penetration tool. So as I read up about it, I realized that I have yet to see an actual tutorial or “how-to” on putting a suite of tools on an iDevice. So this article/how-to/whatever is just that. A document of my experiences turning my iPod Touch into a all-in-one hacking/penetration-testing platform.
Before you jailbreak
So of course, your iDevice should be jailbroken. BUT WAIT!! There are a few very crucial things you MUST know about it being jailbroken. This comes from personal experience and me having to start from scratch. When jailbreaking your iDevice, you MUST make your root partition much bigger then default. My iPod is a 8gb, and since I plan on using it mostly for penetration testing, I set my root partition to 4gb. This leaves enough room for a bit of music while I’m out and about, as well as for a few of those time saving apps. The reason we must do this, is because once you start downloading all of these tools and their dependencies, it starts filling up that ~350MB partition pretty quickly. Most of our tools are going to be command-line based and will be installed on this partition.
How to jailbreak properly
So you are probably wondering how to do this, right? Well, I went through all of the pain to find out how. My iPod had 4.0.1 installed. I went to jailbreakme.com on the device, swiped and now its jailbroken. But thats not it, in order to change the root partition, you must jailbreak it again! Though this time with sn0wbreeze (all links below). Start up sn0wbreeze and select the ipod/phone 4.0 firmware(download below). Be sure to select Expert mode when starting sn0wbreeze, so that you can change your root partition.  Once you get to that screen set it to AT LEAST 2gb.  Just remember though, once this is set, you can’t change it again without restoring from scratch.   Once you have the ipws created, open up iTunes, connect your iDevice, and in the iPod/Phone menu click on restore while holding down the SHIFT key.  This will allow you to browse for your custom firmware ipws.  Pick your sn0wbreeze one, should be in the same folder as sn0wbreeze, or could be on the Desktop.  Your iDevice should begin to restore.  Now here is where I ran into another problem.
EDIT: BigBubbaX, from the comments below, has posted a link to a guide for jailbreaking MC model iPod Touch’s.  Please refer to it if your iPod Touch is an MC model.  Check this by going to Settings -> General -> About, and looking at ‘Model.’ http://www.geekword.net/jailbreak-ios-4-ipod-touch-2g-mc-sn0wbreeze-1.7/
Possible errors
Error 3194:
You may get an error 3194 in iTunes.  This is because iTunes is attempting to match the signature of the selected firmware to Apples servers.  It won’t match because we’ve made a custom one.  To get around this problem, navigate to volume:\Windows\System32\drivers\etc\ and open up the host file with notepad.  You’ll then want to add the following line: 74.208.10.249 gs.apple.com .  This will point iTunes to saurik’s signature server.  Who is the creator of Cydia.
Error 1604:
This is simply because your iDevice is not yet jailbroken.  Jailbreak with jailbreakme.com, or with the latest version of redsn0w.
First thing’s first
Now that we have a successfully jailbroken iDevice with a large root partition, (if not, comment below and I’ll get ya taken care of!  we need to get a few essentials installed.  Most of these can be found in the Cydia app store, so long as you select ‘Developer Mode’ at the start of Cydia.  If you didn’t, thats okay, just go to Manage, then click on settings in the top left corner, and select it there.  If you don’t, you won’t see any of the command line tools we need.
OpenSSH
So now go to search and look for OpenSSH.  Something I don’t like about Cydia is it’s search standards.  In order to find OpenSSH quicker, you need to type in ‘SS’, then search.  If you type in SSH, you won’t find anything.  So now that you have that installed, you can SSH into your device and execute commands that way.  Trust me, it gets tiring doing everything on that tiny keyboard.  One thing you need to know about connecting via SSH is you must turn Auto-lock off on your iDevice.  If the screen goes dim, wifi turns off.  I can’t say the same for edge or 3g though, since I’m not using an iPhone.  Once you have OpenSSH installed, you need to log in via your favorite ssh client.  I’m using PuTTy.  I also find it easier to log in as “root@yourinternalip”  then use your default password “alpine.”  Change this immediately, there are people out there who will try to break in to your iDevice.  Change it using the command, “passwd <newpass>”.
Mobile Terminal
As of this current date (08/18/2010), the Mobile Terminal app in Cydia will not work on 4.0.  So I found one else where online and uploaded it my server.  So first you need to make sure you have cURL installed.  Do this by going to Cydia -> Manage -> Packages and look for it.  If it is not already installed, search cydia for ‘curl’, and install.  This will allow us to download files via terminal.  Now, in your SSH session, type “curl -O http://repo.nickmpetty.com/MobileTerminal-crnt.deb”.  Once it has finished downloading, you need to make Cydia install it.  Do this be making sure you have the AutoInstall folder.  It should be located in /var/root/Media/Cydia/AutoInstall.  If it is not there, create it using the mkdir command(all case sensitive).  Next move your MobileTerminal-crnt.deb from the directory you downloaded it in(this should be /var/root/ if you did it over ssh).  So you would type “mv /var/root/MobileTerminal-crnt.deb /var/root/Media/Cydia/AutoInstall” .  Now close Cydia, if it was open, and re-open it.  This will load the new package.  If you still don’t see it on SpringBoard(where all of your apps are), respring with winterboard, or download a respring app in Cydia and run it.  Now you have a working Mobile terminal, and it will be updated by Cydia as new versions come out.  This should work with any .deb file that has been said to work on an iDevice.
EDIT: Alex, from the comments below, has informed me that you can add “http://podzombie.com/repository” to Cydia to download a working version of MobileTerminal.
Lets build a shell…
Now we need to install some base tools and packages that are normally included on a normal linux computer.  Most of these can all be found in Cydia without any problems.  Install “unzip, adv-cmds, aptitiude, apt 0.6 transitional, inetutils, iPhone/Python, make, subversion, wget, iDNS, stunnel, tcpdump, setup tools, ruby, OpenSSH, OpenSSL, MetaSploit”  Some of these packages we’ve installed already, and may already be installed with other packages.  So just be sure you have all of those tools at least.
Perl
In order to install Perl, we have to go back in via ssh or terminal.  If you use mobile terminal, be sure to login as root with the “su” command.  You may be able to find it in Cydia, or via “apt-get install perl”.  If not, do it this way.  Execute “curl -O http://coredev.nl/cydia/coredev.pub”.  Then run “apt-key add coredev.pub”.  If you get an error, it’s all cool, just move on.  Now type, “echo ‘deb http://coredev.nl/cydia iphone main’ > /etc/apt/sources.list.d/coredev.nl.list”.  Then, “apt-get update”, and “apt-get install perl”.  Thats it.  You can now delete that coredev.pub file.
Now for the fun part
First we are going to create a folder to hold all of our non-install command-line tools.  I created a folder called ‘pentest’ in the /var/root/ directory.  you can create this anywhere you’d like though.
We can now begin installing the tools that we will be using for our penetration needs.
Ettercap-ng
First is ettercap-ng.  As always, try searching Cydia for it.  If you can’t find it there, do this.  Add this source to Cydia, (edit: 08/22/2010)”http://cydia.theworm.tw/cydia”. The search for ettercap.  Also install libnet if it is not already installed.  There have been reports of ettercap not forwarding packets correctly, but the problem is being resolved, if it hasn’t been already.
aircrack-ng
Next is aircrack-ng.  If you can’t find it in Cydia,  very simply execute, “curl -O http://repo.nickmpetty.com/touchair.zip”, then “uzip touchair.zip”.  Now move the extracted to folder to “pentest” if its not there already.  To use, navigate to your aircrack folder and execute commands as normal.
EDIT: to get aircrack, add the following source to Cydia, “http://cydia.xsellize.com”.  Once you’ve  installed it, an icon will appear on SpringBoard, don’t bother with it.  It is only to tell you to run aircrack from the terminal.  Navigate to /var/aircrack/ to use.  You can also move the aircrack folder to your pentest folder if you’d like.
Nikto2
To get nikto2 we can use the svn command.  Make sure you’ve install Subversion and execute, “svn co http://svn2.assembla.com/svn/Nikto_2″.  It will then download the folder, move it to pentest and then navigate to the nikto2 folder, and the next folder then execute as normal.
SET (Social Engineering Toolkit)
SET is one of my favorite tools, so to install it, use svn again, “svn co http://svn.thepentest.com/social_engineering_toolkit/ SET/”.  And again, move it to your pentest folder, then SET, and go as normal once again.  A problem I’ve discovered with this though is that it wont run completely without the python ssl module.  I’ve found one, and tried compiling on the iPod, but it won’t go without a gcc compiler.  I’m working on a work around for it but keep running into errors.  If anyone knows anything about this, please let me know and together we can get this working correctly.
Tools can be found directly in Cydia as well.  Just explore the sections and download what you want.  One more you defentily need is nmap, search Cydia for it.
These are only a few of the things you can do with your iDevice for penetration testing.  If you can’t find a tool in Cydia, just search google, or comment below and I’ll work on getting it to work for your iDevice.  This article serves as a reference, how-to, and documentation of turning your iDevice into a complete penetration testing device.  I’ll update this as I install more tools.  So keep checking back.
Sources:
http://www.offensive-security.com/metasploit-unleashed/Social-Engineering-Toolkit
http://thireus.dareyourmind.net/index.php/iphone-notes/111-iphone-perl-framework
http://www.chiark.greenend.org.uk/~sgtatham/putty/
http://www.assembla.com/spaces/Nikto_2/trac_subversion_tool
http://www.eweek.com/c/a/Security/iPhone-Turned-into-PocketSized-Hacking-Platform/
Written by Nicholas M. Petty


Sources/Links
Original Article on The Wayback Machine: http://web.archive.org/web/20100824080407/http://blog.nickmpetty.com/?p=252
Hackaday Article: http://hackaday.com/2010/08/18/make-iphone-a-penetration-testing-tool/

Other Useful/Interesting Sites
http://ihackmyi.com/topic/82651-how-to-install-set-on-iphone/
http://www.eccouncil.org/CAST-Installing-Metaspoilt-and-SET-on-your-Apple-iDevice.pdf
http://www.offensive-security.com/metasploit-unleashed-training/metasploit-3-4-and-set-on-iphone-4/
http://www.offensive-security.com/offsec/metasploit-4-on-iphone-4s-and-ipad-2/
http://seckev.blog.com/2012/07/16/installation-metasploit-4-2-on-new-ipad-ios-5-1-1-after-jailbreak/
http://hakin9.org/installing-metasploit-and-set-social-engineer-toolkit-on-your-apple-idevice/ [Subscription Required]
http://blog.thireus.com/thireus-repository-new-cydia-security-oriented-repository
http://blog.thireus.com/how-to-install-ios-perl-framework-on-iphone-ipod-touch-or-ipad
https://appsec-labs.com/system/files/Attacking%20iPhone%20Applications.pdf
https://appsec-labs.com/Cydia_explained
https://appsec-labs.com/iNalyzer
http://www.securitylearn.net/tag/iphone-pentesting/
http://www.mayhemiclabs.com/node/15
http://resources.infosecinstitute.com/pentesting-iphone-applications/
http://defcon.org/images/defcon-17/dc-17-presentations/defcon-17-thomas_wilhelm-hacking_ipod_touch.pdf
http://www.toolswatch.org/2012/08/blackhat-arsenal-2012-releases-sira-semi-automated-ios-rapid-assessment-released-at-arsenal/
http://www.siratool.com
http://www.toolswatch.org/2011/06/owasp-igoat-the-learning-tool-for-ios-developers-v1-0-released/
http://code.google.com/p/owasp-igoat/
