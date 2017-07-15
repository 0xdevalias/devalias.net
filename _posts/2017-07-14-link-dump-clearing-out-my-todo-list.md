---
layout: post
title: "Link Dump: Clearing Out My Todo List"
tags:
- linkdump
- dev
- security
- privacy
- productivity
- tmux
- alfred
- yarn
- bower
- metasploit
- docker
- tor
- vpn
- socks
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
I tend to stumble across a lot of interesting things as I travel across the web, and one of my productivity methods is to save the things I don't have time to check out immediately to [Todoist](https://todoist.com/). Unfortunately, time can be short, and life busy, so those 'thats an interesting article', 'i could use that tech thing' and 'that would be cool to blog about' things tend to just build up, and clutter my todo lists in an ever less efficient manner. So today lets clear some of that out!

This post will be a vaguely categorised link dump, and depending on if I remember why I saved it, maybe some notes too.

Looking over everything, there seem to be trends around development, security, privacy, blog/website, docker, tech, automation, branding and general performance/efficiency. Not really surprising when I think about the things that tend to interest me :)

Hope you find something interesting!

## Development

* [The State of Developer Ecosystem 2017 - Infographic | JetBrains](https://www.jetbrains.com/research/devecosystem-2017/)
* [Developer Survey Results 2017 - Stackoverflow](https://insights.stackoverflow.com/survey/2017)
* [A roadmap to becoming a web developer in 2017 – freeCodeCamp](https://medium.freecodecamp.com/a-roadmap-to-becoming-a-web-developer-in-2017-b6ac3dddd0cf)
* [How it feels to learn JavaScript in 2016 – Hacker Noon](https://hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f)
* [Most Used SDKs in Top 200 Free iOS Apps | MightySignal - Mobile App & SDK Intelligence for iOS / Android](https://mightysignal.com/top-ios-sdks)
* Frontend Package Managers
    * [Yarn](https://yarnpkg.com/en/): Package Manager
    * [Yarn: A new package manager for JavaScript](https://code.facebook.com/posts/1840075619545360)
    * [yarnpkg/yarn](https://github.com/yarnpkg/yarn): Fast, reliable, and secure dependency management.
    * [Using Bower with Yarn](https://bower.io/blog/2016/using-bower-with-yarn/): bower support dropped for now
    * [Yarn vs Bower detailed comparison as of 2017 - Slant](https://www.slant.co/versus/17851/5094/~yarn_vs_bower)
    * [13 Best front-end package managers as of 2017 - Slant](https://www.slant.co/topics/1488/~front-end-package-managers)
* Frontend JS Languages 
    * [ES2015 JavaScript vs. Elm vs. TypeScript – Frontend Weekly – Medium](https://medium.com/front-end-hacking/es2015-vs-elm-vs-typescript-a88dbc5d14d9)
    * [Selecting a platform - JavaScript vs Elm vs PureScript vs GHCjs vs Scalajs | MutanatuM](http://mutanatum.com/posts/2017-01-12-Browser-FP-Head-to-Head.html)
* Code Review
    * [Automated code reviews & code analytics | Codacy](https://codacy.com/): Check code style, security, duplication, complexity and coverage on every change while tracking code quality throughout your sprints.
    * [Code Climate](https://codeclimate.com/): Get automated code review for test coverage, complexity, duplication, security, style, and more, and merge with confidence.
* [Conscript — Conscript](http://www.foundweekends.org/conscript/): Distribution mechanism for Scala apps using Github and Maven repositories as the infrastructure. You can use it to install and update apps similar to APT or Home Brew.
* [Giter8 — Giter8](http://www.foundweekends.org/giter8/): Command line tool to generate files and directories from templates published on Github or any other git repository
* [lightbend/paradox](https://github.com/lightbend/paradox): Paradox is a markdown documentation tool for software projects.
* [sirthias/pegdown](https://github.com/sirthias/pegdown/): A pure-Java Markdown processor based on a parboiled PEG parser supporting a number of extensions
* [Ace - The High Performance Code Editor for the Web](https://ace.c9.io/)
    * [ajaxorg/ace](https://github.com/ajaxorg/ace): Ace (Ajax.org Cloud9 Editor)
    * [lyrasoft/ace-markdown-editor](https://github.com/lyrasoft/ace-markdown-editor): A Markdown editor for Joomla CMS
    * [Ace Kitchen Sink](https://ace.c9.io/kitchen-sink.html?doc=Markdown)

## Security

* CTF
    * [Experience IT - Cyber Security | learn2hack | TAFE](http://www.learn2hack.com.au/): Hands on training for high school students run by industry experts with pathways to tertiary qualifications. This course provides an introduction to defensive and offensive security strategies and tactics and is suitable for high school students aged 15-18.
    * [0CTF 2017](https://ctf.0ops.net/)
    * [DEF CON CTF 2017](https://legitbs.net/)
    * [legitbs/quals-2017](https://github.com/legitbs/quals-2017)
    * [legitbs/quals-2016](https://github.com/legitbs/quals-2016): 2016 DEF CON Qualifier Challenges
    * [legitbs/quals-2015](https://github.com/legitbs/quals-2015)
    * [legitbs/finals-2014](https://github.com/legitbs/finals-2014)
    * [legitbs/quals-2014](https://github.com/legitbs/quals-2014)
    * [legitbs/finals-2013](https://github.com/legitbs/finals-2013): Source for many challenges from DEF CON 21 CTF Finals
    * [legitbs/quals-2013](https://github.com/legitbs/quals-2013): Source for many challenges from DEF CON 21 CTF Qualifier
    * [flaws.cloud](http://flaws.cloud/): Through a series of levels you'll learn about common mistakes and gotchas when using Amazon Web Services (AWS).
    * [CrikeyConCTF 2017 – Koala Gallery Writeup](https://dook.biz/2017/03/crikeyconctf-2017-koala-gallery-writeup/)
* BSides 2017
    * [BSidesCBR CTF Round Up | OJ](http://buffered.io/posts/bsidescbr-ctf-round-up/)
    * [OJ/bsides-2017-ctf-docker](https://github.com/OJ/bsides-2017-ctf-docker): BSidesCBR CTF docker compose files
    * [BSides Canberra 2017 CTF - Rekt Exfil Write-up - RootUsers](https://www.rootusers.com/bsides-canberra-2017-ctf-rekt-exfil-write/)
* Reverse Engineering, etc
    * [binary.ninja](https://binary.ninja/): A reverse engineering platform
    * [Kaitai Struct: declarative binary format parsing language](http://kaitai.io/) A new way to develop parsers for binary structures.
    * [Hopper](http://www.hopperapp.com/): The macOS and Linux Disassembler
    * [Cerbero - Profiler](http://cerbero.io/profiler/): Cerbero Profiler is a tool designed primarily for malware and forensic analysis.
* Recon, DNS, etc
    * find IP ranges, reverse IP lookups, etc
    * seclists subdomain section
    * [Brutesubs – An automation framework for running multiple subdomain bruteforcing tools in parallel via Docker](https://abhartiya.wordpress.com/2016/09/20/brutesubs-an-automation-framework-for-running-multiple-subdomain-bruteforcing-tools-in-parallel-via-docker/)
    * [anshumanbh/brutesubs](https://github.com/anshumanbh/brutesubs): An automation framework for running multiple open sourced subdomain bruteforcing tools (in parallel) using your own wordlists via Docker Compose
    * [TheRook/subbrute](https://github.com/TheRook/subbrute): A DNS meta-query spider that enumerates DNS records, and subdomains.
    * [infosec-au/altdns](https://github.com/infosec-au/altdns): Generates permutations, alterations and mutations of subdomains and then resolves them
    * [OJ/gobuster](https://github.com/OJ/gobuster): Directory/file & DNS busting tool written in Go
    * [Bulk access to whois data – APNIC](https://www.apnic.net/manage-ip/using-whois/bulk-access/): apnic offline database
    * [Microsoft/WhoisParsers](https://github.com/Microsoft/WhoisParsers): Download and parse Whois records from bulk whois database dumps of IANA organizations (ARIN, AFRINIC, APNIC, LACNIC, RIPE ). Crawl and parse RWhois records from RFC 2167 ARIN Referral Whois Servers
    * [jhaddix/domain enumall](https://github.com/jhaddix/domain/blob/master/enumall.py): enumall is a refactor of enumall.sh providing a script to identify subdomains using several techniques and tools.
    * [LaNMaSteR53 / Recon-ng — Bitbucket](https://bitbucket.org/LaNMaSteR53/recon-ng): Recon-ng is a full-featured Web Reconnaissance framework written in Python.
    * [dnsenum | Penetration Testing Tools](http://tools.kali.org/information-gathering/dnsenum)
    * [ChrisTruncer/EyeWitness](https://github.com/ChrisTruncer/EyeWitness): EyeWitness is designed to take screenshots of websites, provide some server header info, and identify default credentials if possible.
* Dockerised
    * [Run Metasploit Framework as a Docker Container Without Installation Pains](https://zeltser.com/metasploit-framework-docker-container/)
    * [k0st/alpine-nikto | DockerHub](https://hub.docker.com/r/k0st/alpine-nikto/): Dockerized nikto
    * docker run --rm -it activeshadow/nikto /bin/bash
    * [kost/docker-webscan](https://github.com/kost/docker-webscan): Dockerized versions of various web security scanning tools and utilities
* Frameworks, automation, etc
    * [trustedsec/ptf](https://github.com/trustedsec/ptf): The Penetration Testers Framework (PTF) is a way for modular support for up-to-date tools.
    * [Golismero Project. The web knife.](http://www.golismero.com/)
        * GoLismero is a free software framework for security testing. It's currently geared towards web security, but it can easily be expanded to other kinds of scans. It can run their own security tests and manage a lot of well known security tools (OpenVas, Wfuzz, SQLMap, DNS recon, robot analyzer...) take their results, feedback to the rest of tools and merge all of results. And all of this automatically.
        * [golismero/golismero](https://github.com/golismero/golismero)
    * [SpiderFoot – Open Source Intelligence Automation](http://www.spiderfoot.net/)
        * [smicallef/spiderfoot](https://github.com/smicallef/spiderfoot): SpiderFoot, the open source footprinting and intelligence-gathering tool. 
* [Vulnerability Rating Taxonomy | Bugcrowd](https://bugcrowd.com/vulnerability-rating-taxonomy)
    * Bugcrowd’s VRT is a resource outlining Bugcrowd’s baseline priority rating, including certain edge cases, for vulnerabilities that we often see.
    * [bugcrowd/vulnerability-rating-taxonomy](https://github.com/bugcrowd/vulnerability-rating-taxonomy)
* [PasteMonitor](https://www.pastemonitor.com/): PasteMonitor watches for keywords you're interested in on Pastebin.
* [RequestBin — Collect, inspect and debug HTTP requests and webhooks](https://requestb.in/)
* [Runscope/requestbin](https://github.com/Runscope/requestbin): Inspect HTTP requests. Debug webhooks.
* [maurosoria/dirsearch](https://github.com/maurosoria/dirsearch): Web path scanner
* [ImageTragick/PoCs](https://github.com/ImageTragick/PoCs): Proof of Concepts for CVE-2016–3714 https://imagetragick.com
* [malfunkt/hyperfox](https://github.com/malfunkt/hyperfox) ([web](https://hyperfox.org/)): HTTP/HTTPs MITM proxy and traffic recorder with on-the-fly TLS cert generation
* [reverse-shell/routersploit](https://github.com/reverse-shell/routersploit): The Router Exploitation Framework
* [Evilginx - Advanced Phishing with Two-factor Authentication Bypass](https://breakdev.org/evilginx-advanced-phishing-with-two-factor-authentication-bypass/)
* [Secrets and LIE-abilities: The State of Modern Secret Management [2017]](https://medium.com/on-docker/secrets-and-lie-abilities-the-state-of-modern-secret-management-2017-c82ec9136a3d)
* [Vulnerability Disclosures | CERT Australia](https://www.cert.gov.au/vulnerability-disclosures)
* Where are BURP setttings saved?
    * On OSX it is stored in the com.apple.java.util.prefs.plist under ~/Library/Preferences.
    * Also, you need to make sure you use the burp->exit to quit and not the Burp.StartBurp->Quit (Command-Q) to exit. Otherwise, it will not save the settings.

## Privacy

* [VPN over DNS](http://www.shellntel.com/blog/2016/3/30/vpn-over-dns-1)
* [Whonix](https://www.whonix.org/wiki/Main_Page): Whonix is a free desktop operating system (OS) that is specifically designed for advanced security and privacy. Based on Tor, Debian GNU/Linux and the principle of security by isolation, it realistically addresses common attack vectors while maintaining usability.
* [Docker image with Tor, Privoxy and a process manager under 15 MB](https://medium.com/@rdsubhas/docker-image-with-tor-privoxy-and-a-process-manager-under-15-mb-c9e344111b61#.csolccvds)
* [1: How to Route Traffic through a Tor Docker Container](https://blog.jessfraz.com/post/routing-traffic-through-tor-docker-container/)
* [2: Running a Tor relay with Docker](https://blog.jessfraz.com/post/running-a-tor-relay-with-docker/)
* [3: Tor Socks Proxy and Privoxy Containers](https://blog.jessfraz.com/post/tor-socks-proxy-and-privoxy-containers/)
* Advanced Privacy and Anonymity Using VMs, VPN’s, Tor
    * [Part 1 - Introduction to Series](https://www.ivpn.net/privacy-guides/advanced-privacy-and-anonymity-part-1)
    * [Part 2 - Basic Setup Using VM's, VPNs and TOR](https://www.ivpn.net/privacy-guides/advanced-privacy-and-anonymity-part-2)
    * [Part 3 - Planning Advanced VM and VPN Setup](https://www.ivpn.net/privacy-guides/advanced-privacy-and-anonymity-part-3)
    * [Part 4 - Setting Up Secure Host Machines](https://www.ivpn.net/privacy-guides/advanced-privacy-and-anonymity-part-4)
    * [Part 5 - Installing VirtualBox and Creating Linux VMs](https://www.ivpn.net/privacy-guides/advanced-privacy-and-anonymity-part-5)
    * [Part 6 - Creating pfSense 2.2.6 VMs as VPN Clients](https://www.ivpn.net/privacy-guides/advanced-privacy-and-anonymity-part-6)
    * [Part 7 - Paying Anonymously with Cash and Bitcoins](https://www.ivpn.net/privacy-guides/advanced-privacy-and-anonymity-part-7)
    * [Part 8 - Creating Nested Chains of VPNs and Tor](https://www.ivpn.net/privacy-guides/advanced-privacy-and-anonymity-part-8)

## Blog / Website / Social

* [Ultimate Guide to Blocking and Cleaning Google Analytics Spam and Other Junk Traffic](https://www.ohow.co/removing-google-analytics-spam/)
* [The Ultimate Guide to Instagram Hashtags in 2017](https://later.com/blog/ultimate-guide-to-using-instagram-hashtags/)
* [Staticman](https://staticman.net/docs/): I bring user-generated content to static sites
* Blog Inspiration
    * [Amy/Rhiaro | tampering with arrangements](http://rhiaro.co.uk/): Lots of social web/lifelogging type stuff, seems cool
    * [What I bought | Save. Spend. Splurge.](http://www.savespendsplurge.com/tag/what-i-bought/): Lifelogging type stuff
    * [aarongustafson/aarongustafson.github.io](https://github.com/aarongustafson/aarongustafson.github.io/tree/source) ([web](https://www.aaron-gustafson.com/)): Web standards & accessibility advocate at Microsoft
* Jekyll
    * [How I’m Using Jekyll in 2016](https://mademistakes.com/articles/using-jekyll-2016/)
    * [Jekyll Collections](https://jekyllrb.com/docs/collections/): For writings/etc?
* Jekyll Plugins
    * [Generate a /tag/index.html · Issue #43 · pattex/jekyll-tagging](https://github.com/pattex/jekyll-tagging/issues/43#issuecomment-289595438): TODO: Implement tag_cloud for my blog
    * [jekyll/jekyll-archives](https://github.com/jekyll/jekyll-archives): Archive pages for your Jekyll tags and categories
    * [pattex/jekyll-tagging](https://github.com/pattex/jekyll-tagging): Jekyll plugin to automatically generate a tag cloud and tag pages.
    * [toshimaru/jekyll-tagging-related_posts](https://github.com/toshimaru/jekyll-tagging-related_posts): Jekyll related_posts function based on tags (works on Jekyll3)
    * [octopress/paginate](https://github.com/octopress/paginate/): A simple paginator for Jekyll sites. 
    * [jekyll/jekyll-assets](https://github.com/jekyll/jekyll-assets): Asset pipelines for Jekyll.
    * [robwierzbowski/jekyll-picture-tag](https://github.com/robwierzbowski/jekyll-picture-tag): Easy responsive images for Jekyll.
    * Jekyll wiki plugin?
* GitHub Issues
    * [Make this a ruby gem · Issue #6 · indirect/jekyll-postfiles](https://github.com/indirect/jekyll-postfiles/issues/6)
    * [Give rake task the ability to detect and notify pingback endpoints · Issue #11 · aarongustafson/jekyll-webmention_io](https://github.com/aarongustafson/jekyll-webmention_io/issues/11)
    * [Rake task will download entire file looking for webmention endpoint · Issue #12 · aarongustafson/jekyll-webmention_io](https://github.com/aarongustafson/jekyll-webmention_io/issues/12)
* Discoverability, etc
    * [oEmbed](http://oembed.com/):oEmbed is a format for allowing an embedded representation of a URL on third party sites.
    * [Ping-o-Matic!](http://pingomatic.com/): Ping-O-Matic is a service to update different search engines that your blog has updated.
    * [Syndicating content with RSS](https://developer.mozilla.org/en-US/docs/Web/RSS/Getting_Started/Syndicating)
* Indieweb, etc
    * [IndieWebify.Me - a guide to getting you on the IndieWeb](http://indiewebify.me/): We should all own the content we're creating, rather than just posting to third-party content silos.Publish on your own domain, and syndicate out to silos. This is the basis of the "Indie Web" movement.
    * [Activity Streams](http://activitystrea.ms): JSON Activity Streams Spec
    * [backfeed - IndieWeb](http://indiewebcamp.com/backfeed): Backfeed is the process of syndicating interactions on your POSSE copies back (AKA reverse syndicating) to your original posts.
    * [Bridgy - IndieWeb](http://indiewebcamp.com/Bridgy): Bridgy is an open source project and proxy that implements backfeed and POSSE as a service. Bridgy sends webmentions for comments, likes, etc. on Facebook, Twitter, Google+, Instagram, and Flickr.
    * [snarfed/bridgy](https://github.com/snarfed/bridgy): Bridgy pulls comments and likes from social networks back to your web site. You can also use it to publish your posts to those networks.
    * [Webmention - IndieWeb](http://indiewebcamp.com/webmention#Services): Services you can use with Webmention to send copies of your posts to social meda sites (silos), and receive silo-specific interactions as Webmentions on your site!
    * [Checkmention](https://checkmention.appspot.com/): This site lets you test your webmention implementation on your indieweb site, and whether it robustly detects certain types of XSS attacks.
    * [indieweb/mention-client-ruby](https://github.com/indieweb/mention-client-ruby): A Ruby gem for sending webmention (and pingback) notifications
    * [W3C social working group](https://www.w3.org/wiki/Socialwg)

## Docker

* [Perlence/docker-multi-build](https://github.com/Perlence/docker-multi-build): Concurrent multi-stage Docker builds
    * This is outdated now, it exists in docker core
* [How to Cross Compile Go Programs using Docker | Iron.io](https://www.iron.io/how-to-cross-compile-go-programs-using-docker/)
* [golang | DockerHub](https://hub.docker.com/_/golang/)

## Automation, Scraping, etc

* [Guide to Web Automation | Hackernoon](https://hackernoon.com/guide-to-web-automation-889557804453)
    * [peterdemin/web-automation-2017](https://github.com/peterdemin/web-automation-2017): An attempt to cover state of web automation in 2017
        * This GitHub should have a bunch of other projects detailed in some of the (probably closed) issues
* [Scrapy](https://scrapy.org/): An open source and collaborative framework for extracting the data you need from websites.
In a fast, simple, yet extensible way.
* [scrapinghub/portia](https://github.com/scrapinghub/portia/): Visual scraping for Scrapy
* [Netflix/Scumblr](https://github.com/Netflix/Scumblr): Web framework that allows performing periodic syncs of data sources and performing analysis on the identified results
* [Home Assistant](https://home-assistant.io/): Home Assistant is an open-source home automation platform running on Python 3.

## Tech

* Tmux
    * [jimeh/tmuxifier](https://github.com/jimeh/tmuxifier): Tmuxify your Tmux. Powerful session, window & pane management for Tmux.
    * [tmuxinator/tmuxinator](https://github.com/tmuxinator/tmuxinator): Manage complex tmux sessions easily
* [dundalek/markmap](https://github.com/dundalek/markmap): Visualize markdown documents as mindmaps
    * Can we use this to make nice markdown mindmap summaries?
* [donnemartin/haxor-news](https://github.com/donnemartin/haxor-news): Browse Hacker News like a haxor: A Hacker News command line interface (CLI).
* [Where does launchpad store folder information? (database, etc?)](https://apple.stackexchange.com/questions/237136/where-does-launchpad-store-folder-information-database-etc)
* [The Definitive Platform for Modern Apps | DC/OS](https://dcos.io/): DC/OS (the datacenter operating system) is an open-source, distributed operating system based on the Apache Mesos distributed systems kernel.
* [snapcraft - Snaps are universal Linux packages](https://snapcraft.io/): package linux apps for every linux/server/cloud/device

## Branding

* [The Three-Hour Brand Sprint – GV Library](https://library.gv.com/the-three-hour-brand-sprint-3ccabf4b768a#.h7s3gqfx8)
* [Announcing a New Logo and Style for Docker - Docker Blog](https://blog.docker.com/2013/06/announcing-new-docker-style/)
* [Logo Design - Get A Custom Logo Design from Professional Logo Designers | 99designs](https://99designs.com.au/logo-design)
* [Docker - Create cool open-source project logo. | Logo design contest](https://99designs.com.au/logo-design/contests/create-cool-open-source-project-logo-219415)

## Alfred-esque

* [Homebrew and Cask for Alfred](http://www.packal.org/workflow/homebrew-and-cask-alfred)
* [Alfred Workflow for Homebrew (danielbayerlein/alfred-workflows)](https://github.com/danielbayerlein/alfred-workflows/tree/master/homebrew)
* [idpaterson/alfred-wunderlist-workflow](https://github.com/idpaterson/alfred-wunderlist-workflow): Unbelievably fast task entry in Wunderlist with due dates, reminders, and recurrence
* [Lacona](https://www.lacona.io/): Blazingly fast, blissfully simple, incredibly powerful keyboard-driven commands for your Mac
* [laconalabs/lacona-cli](https://github.com/laconalabs/lacona-cli)
* Automator services ~/Library/Services

## Windows

* [Boxstarter](http://boxstarter.org/): Repeatable, reboot resilient windows environment installations made easy using Chocolatey packages
* [Chocolatey - The package manager for Windows](https://chocolatey.org/)
* [NuGet Gallery | Home](https://www.nuget.org/)

## MacOS (OSX) on Windows

* [Apple Magic Magic Trackpad 2](http://www.apple.com/au/shop/product/MJ2R2ZA/A/magic-trackpad-2)
* [ExtraMagic](http://extramagic.forbootcamp.org/): OSX-Trackpad Multitouch on Windows
* [Seer](https://sourceforge.net/projects/ccseer/): OSX-like Spacebar Preview on Windows

## GitHub

* [`brew bundle check` should list whats missing · Issue #147 · Homebrew/homebrew-bundle](https://github.com/Homebrew/homebrew-bundle/issues/147): brew bundle check/dryrun
* [Broken links in readme · Issue #123 · erocarrera/pefile](https://github.com/erocarrera/pefile/issues/123)
* [Better modularisation · Issue #124 · erocarrera/pefile](https://github.com/erocarrera/pefile/issues/124)
* [Flag to skip parsing on PE object instantiation · Issue #125 · erocarrera/pefile](https://github.com/erocarrera/pefile/issues/125)
* [Github Flavoured Markdown · Issue #580 · jgm/gitit](https://github.com/jgm/gitit/issues/580)

## Quantified Self

* [Sense](https://hello.is/): Sleep tracker

## Performance, nootropics, etc

* [Hong](https://www.hongstarr.com/): Bulletproof Coach in Melbourne, written up on Living Bulletproof, etc
* [Hapi | Flow](https://www.gethapi.com.au/products/flow)
* [Total Nootropics](https://www.totalnootropics.com.au/collections/all-products)
* [Nootroplus - Premium Nootropics](https://nootroplus.com/)

## Interests, activities, etc

* Climbing
    * [Courses - Blue Mountains Climbing School](http://climbingschool.com.au/courses/)
* Archery
    * [Canberra Archery - Come and Try](https://www.canberraarchery.club/come-and-try)
    * [Tuggeranong Archery - Come and Try](http://home.tuggeranongarchery.com/index.php/activities/come-and-try)
    * [Weston Valley Archery Club - Come and Try](http://www.wvac.asn.au/beginners.html)
    * [Capital Field Archers](http://capitalfieldarchers.com.au/)
    * [Branch F - Southern NSW & ACT](https://www.bowhunters.org.au/index.php/author-login/branch-f-southern-nsw-act)
    * [BowHunters](https://www.bowhunters.org.au/)
* Shooting
    * [SSAA ACT Inc](http://ssaa.org.au/act/ssaa-act-inc.html)
    * [ACT Smallbore Rifle Club Inc](http://actsmallborerifleclub.com/)
    * [Canberra Rifle Club](http://www.canberrarifleclub.org.au/wordpress/?page_id=110): Preliminary Information for Interested Persons
* Medieval
    * [Ancient Arts Fellowship](https://www.facebook.com/AncientArtsFellowship/)
    * [Ancient Arts Fellowship - Fighting](http://www.aaf.org.au/fighting/)
    * [The Hundred Swords](https://www.facebook.com/TheHundredSwords)
    * [The Barony of Politarchopolis](http://politarchopolis.lochac.sca.org/)

## Gaming

* [Raptr](http://raptr.com/): Raptr makes PC gaming fast, beautiful, and hassle-free.
* [Gameplay Time Tracker](http://www.gameplay-time-tracker.info/en/download.aspx)

## Unsorted

* [GitBook · Documentation made easy](https://www.gitbook.com/)
* [Blinkist: Serving curious minds](https://www.blinkist.com/en/pricing.html)
* [iSite 20/20 - Take control of your vision](http://isite2020.com.au/)
