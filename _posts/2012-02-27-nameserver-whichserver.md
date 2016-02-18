---
layout: post
title: Nameserver? Whichserver?
date: '2012-02-27T16:46:00-07:00'
tags:
- Plesk
- DNS
- Subdomain
- Nameserver
- "*headdesk*"
tumblr_url: http://blog.devalias.net/post/18368234347/nameserver-whichserver
---
Note: This had been sitting in my queue half written for a month or two now.. Woops. - alias
I’ve been having some issues getting subdomains working correctly. Put a little bit of time/effort into it here and there, but never really sat down to figure it out until tonight. Figured it out, and then promptly smacked my head on the desk at how simple the solution was.
I’ve changed the actual domains, but the process is the same.
The Problem
I recently purchased a new domain (let’s call it newsite.com), which I configured to use the nameservers at ns1.hostingprovider.com and ns2.hostingprovider.com. So far so good, or so I thought. I then proceeded to configure newsite.com in Plesk on the VPS (virtual private server) that I rent from hostingprovider.com, which is setup on myvps.net.
So far so good. I then created a subdomain in Plesk (foo.newsite.com), uploaded some test content and tried to access it. No good. Maybe it just needed to propagate? I put it aside and promptly forget about the new site for a week. Coming back to it I realised that it still wasn’t working (even though the DNS had well and truly propagated by now)
The Solution
..was so simple I can’t believe it took me as long as it did to figure it out. Let’s go back to what i said a little earlier..

which I configured to use the nameservers at ns1.hostingprovider.com and ns2.hostingprovider.com

Which isn’t the same as the nameserver running on my VPS (myvps.net)
To cut what was a long story short, I turned off the nameserver on the VPS (wasn’t using it, so why waste the resources) and manually created the subdomain in my hosting providers configuration. Save here. Wait there. Load the website. Oh look, it works now. Funny how updating the correct config makes things work.
*headdesk*
