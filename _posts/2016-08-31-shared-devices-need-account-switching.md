---
layout: post
title: Shared Devices Need Account Switching
tags:
- dev
- tech
- apple
- apple-tv
- tvOS
- iOS
- personalisation
- improvements
- plex
- netflix
- youtube
- ted
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
Living in share houses and using tech like the Apple TV has highlighted an annoying situation: so many apps these days want you to sign in to enable access, personalised features, etc; but most offer no good solution for when you share the device with other people.

There are some apps out there that handle this pretty well:

* [Plex](https://www.plex.tv/) allows you to switch between different users in your 'home', each of which can either be a fully independent account, or a 'managed user' that exists under the main account.
* [Netflix](https://www.netflix.com/au/) allows switching between different users under the one subscription. While this is ok.. it doesn't work so well for a share house. What if we each have our own Netflix subscriptions, but want to share the device without having to log out and back in to our own accounts?

And then there are so many apps that don't even seem to give the option, two of which immediately jump to mind for me:

* [YouTube](https://www.youtube.com/) let's you sign in to a single account, but no switching features save for logging out.
* [TED](https://www.ted.com/)'s app suffers from the same issue.

This could be fixed at the individual app level. It would be REALLY nice to see support for multiple account switching added to any app made for a device that could potentially be shared (Apple TV/etc, far less likely to be useful on an iPhone.. but it might be for some users) But this requires extra effort from every app developer out there. Perhaps a common framework could be developed to help support this.. but then making it generic enough to fit into everyone's different architectures would be a challenge.

An even better solution could be baked into the OS itself by Apple.. I boot up my Apple TV and am presented with an account chooser asking which particular registered user I am. If I haven't already logged in, there's the option for signing in to my Apple account to add myself as a new user. Once logged in, I'm presented with my own homescreen of apps, laid out to my own preferences, logged in to my own accounts, and saving my own personal data.

This poses some issues about duplication of apps between users, space requirements, etc. So a mid-ground could be allowing the owner/'master' user to control app installation, but then for each other user to be able to maintain their own stored data/signin status/etc.

What do you think? Is this a feature you'd use, or does it just seem like over-engineered bloat? Let me know your thoughts in the comments!