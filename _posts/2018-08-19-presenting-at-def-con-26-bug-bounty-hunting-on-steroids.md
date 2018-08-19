---
layout: post
title: "Presenting at DEF CON 26 - Bug Bounty Hunting on Steroids"
tags:
- security
- automation
- speaker
- defcon
- reconvillage
- bountymachine
- bugbounty
- anshumanbh
- mhmdiaa
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: true
crossposted:
- https://medium.com/@devalias/presenting-at-def-con-26-bug-bounty-hunting-on-steroids-df3273c2853a
- https://www.linkedin.com/pulse/presenting-def-con-26-bug-bounty-hunting-steroids-grant/
- https://www.linkedin.com/feed/update/urn:li:activity:6436734460477214720
- https://twitter.com/_devalias/status/1030967390048153600
---
Wow, what a trip! I just had the opportunity to not only live out a childhood dream of attending [DEF CON](https://www.defcon.org/), but I even had the privilege to be able to present at the [DEF CON Recon Village](http://reconvillage.org/talks-2018/#bug-bounty-hunting-on-steroids---anshuman-bhartiya-and-glenn-devalias-grant)! Talk about achievement unlocked!

If you've been [following along on twitter](https://twitter.com/i/moments/1030953718177394688), you might be aware that I've been working on a security automation framework with regards to bug bounty hunting; to increase our agility, automate the boring bits, and let us JustHackThings. It's something that our team ([@anshuman_bh](https://twitter.com/anshuman_bh), [@mhmdiaa](https://twitter.com/mhmdiaa), and [myself](https://twitter.com/_devalias)) have been calling BountyMachine.

It's no secret in the security/pentest/bug bounty world that there are a lot of boring bits when it comes to assessments. The recon, finding good targets, and all those things that eventually lead to being able to do all of the sweet hacks. There are a lot of people thinking about and working in this space to try and make things better, both publicly/open source, as well as privately with their own methods and frameworks.

[@anshuman_bh](https://twitter.com/anshuman_bh) has been working on improving this space over a number of years, with various open source projects and explorations (such as [brutesubs](https://github.com/anshumanbh/brutesubs), [FASTSAM](https://github.com/anshumanbh/FASTSAM), [hodor](https://github.com/anshumanbh/hodor), [kubebot](https://github.com/anshumanbh/kubebot), etc) eventually leading us to where we are now. It was actually after I referenced some of his projects in my talk ["Gophers, whales and.. clouds? Oh my!"]({% post_url 2017-11-19-presenting-all-the-things-bsides-wellington-csides-sectalks %}) ([GitHub](https://github.com/0xdevalias/gopherblazer)) at BSides Wellington last year that he reached out about this current project. Not to mention [@mhmdiaa](https://twitter.com/mhmdiaa)'s ["Automation For Bug Hunters" presentation on Bug Bounty World](https://www.youtube.com/watch?v=3Q-QyGlc_Xk) ([slides](https://speakerdeck.com/mhmdiaa/automation-for-bug-hunters)) and other work in this space. With our views and efforts so closely aligned we decided to join forces and work on this latest rendition, a v3 of sorts, BountyMachine.

So coming back to our talk at DEF CON this year, "Bug Bounty Hunting on Steroids" was an opportunity to share what we have been working on, along with some of the process, patterns, ideas and lessons we have learned along the way; with the ultimate goal of inspiring others to think outside the current box, and reinvent the way we all approach our security research.

I put together a little [overview post for our work blog at TSS](https://medium.com/tsscyber/def-con-2018-6ff9542451b8#906b) (we had a few of us speaking this year!), so instead of repeating all of the talk specifics you can check that out. I will reshare the [talk overview](http://reconvillage.org/talks-2018/#bug-bounty-hunting-on-steroids---anshuman-bhartiya-and-glenn-devalias-grant) here though, for posterity:

> Bug bounty programs are a hot topic these days. More and more companies are realizing the benefits of running a program, and researchers are jumping at the opportunity to grab some swag and make some extra cash from the bugs they find. Reporting security issues has never been as easy, open, and risk-free as it is right now. Everybody wins!
>
> Though that doesn’t mean we should stop there. As researchers, we spend a lot of time doing the same menial tasks for each program: monitoring for new targets, checking for common issues, remembering just which flags you needed to pass to that tool (or even which tool is best for that job). We build new tools, hack together shell scripts, and generally make small incremental changes to our process. But surely there’s a better approach?
>
> Are you sick of repeating the same tedious tasks over and over? Wouldn’t it be nice to have your own bug hunting machine? One that -
>
> * Is always watching
> * Reacts as soon as a new target becomes available
> * Takes care of those tedious repetitive steps for you
> * Makes life easy when you want to integrate a new tool/workflow
> * Doesn’t cost the world to run, and trivially scales
> * Leverages lessons and technologies battle tested in the dev world to improve your offensive capacity, capability and productivity
> * Monitors your own infrastructure and reacts before hackers can (while saving you the cost of those Bug Bounty payouts in the meantime)
>
> We call this approach Bug Bounty Hunting on Steroids. We will discuss our research and approach to building such a machine, sharing some of the lessons we learned along the way.

Now if you didn't manage to catch us at DEF CON (and I don't blame you, there was SO much happening ALL THE TIME.. it's such a non-stop week..) don't fret! Our [slides are online](https://speakerdeck.com/bountymachine/bug-bounty-hunting-on-steroids), we put together a bit of a [blog post covering a bunch of the areas we were talking about](https://medium.com/@bountymachine/introducing-bountymachine-234cad93b5d2), and I believe the talk was also recorded, so once that is online I will link to that too. Or if Twitter is more your style, go along and [retweet this one](https://twitter.com/_devalias/status/1030946732069142528) (and make sure to follow the team for more BountyMachine updates!).

The response to our talk has been awesome: we packed out the presentation room, had a lot of really interesting questions after the talk; and have had a constant stream of feedback, questions and support on twitter and elsewhere since.

I truly believe that this is the space we need to be thinking and working in right now:

* encoding and automating our processes
* improving our tooling
* accelerating our agility
* collaboratively working to improve the entire security space

Does this resonate with you? Are you sick of the same repetitive manual processes again and again? Want to automate it? Want to save your precious time for actually doing the interesting hacks? Me too! Let's talk! You can find me here in the comments, [twitter](https://twitter.com/_devalias), or idling around the various slack channels (user: devalias) and otherwise across the internet. How can we work together to improve the entire state of things?
