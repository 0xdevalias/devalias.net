---
layout: post
title: Rails, OmniAuth and [stealthmode].. Oh my!
date: '2013-07-31T15:00:50-07:00'
tags:
- ruby-on-rails
- ruby
- omniauth
- 37signals
- daniel-kehoe
- rails-composer
- rails-generate
- rails-new
- lamp
- rails-api
- rails-server
- google-is-your-friend
- rails-casts
- todo
- tldr
tumblr_url: http://devalias.tumblr.com/post/56944918201/rails-omniauth-and-stealthmode-oh-my
redirect_from: /post/56944918201/rails-omniauth-and-stealthmode-oh-my
---
(**tl;dr**: [Rails](http://rubyonrails.org/) is awesome, [OmniAuth](https://github.com/intridea/omniauth) is super useful, check out my new website [currently in stealthmode])

Last Friday (N.B When I started writing this article it was last friday.. it's been sitting here half finished for a while now.. :S my bad..) while sitting at work hacking out whatever I was working on at the time, I had an idea for a simple little website I wanted to put together. I quickly jotted down some notes, then left it till later on that evening.

I was originally thinking of hacking it together in [PHP](https://secure.php.net/) (since that's what i have the most backend experience with), but decided that I would use this as an excuse to play with something I've wanted to learn for a while: [Ruby on Rails](http://rubyonrails.org/).

Needless to say, like any good little geeky hacker type, I had heard a LOT of good things about Rails (and I suppose it helps that it originated at one of my favourite tech companies [37signals](http://37signals.com/opensource)), though never quite had the project or motivation to give it a proper try.. until now..

## Rails

Who? What? How? Where? Why?

* Ruby on Rails (often just called Rails) is a Ruby framework for building websites/applications.
* It establishes conventions/tools for easier setup, collaboration and maintenance. Including:
  * [Rails API](http://api.rubyonrails.org/) – The official Rails API. Treat this like your bible.
  * [Rails New](http://guides.rubyonrails.org/command_line.html#rails-new) – Creates a new rails application (including setting out the folder structure, base files, etc (saves SO much time, and gives a pretty good basis for getting a running start on new projects)
  * [Rails Server](http://guides.rubyonrails.org/command_line.html#rails-server) – Who needs a seperate [LAMP](https://en.wikipedia.org/wiki/LAMP_(software_bundle)) when you can have everything you need to get started already!
  * [Rails Generate](http://guides.rubyonrails.org/command_line.html#rails-generate) – Makes use of templates to generate a whole pile of things, and generally make your life much easier. You may also be interested in taking a look at [Rails Composer](https://github.com/RailsApps/rails-composer) for added life-ease benefits.
  * And many more [cool things..](http://guides.rubyonrails.org/command_line.html)
* Rails has a vast and active community.
* Many libraries (Called gems, [see RubyGems](https://rubygems.org/)) exist and are being constantly created/updated that simplify the achievement of complex tasks.

If you want to read something a bit more detailed, perhaps one of these can tickle your fancy:

* [What is Ruby on Rails?](https://railsapps.github.io/what-is-ruby-rails.html) by Daniel Kehoe.
* [RailsCasts](http://railscasts.com/) - TONS of cool tutorials/walkthroughs/information. 

## OmniAuth

Since there's probably noone better to explain what [OmniAuth](https://github.com/intridea/omniauth) is than the developers themselves, i'll let them describe it:

> OmniAuth is a Ruby authentication framework aimed to abstract away the difficulties of working with various types of authentication providers. It is meant to be hooked up to just about any system, from social networks to enterprise systems to simple username and password authentication.

As with everything else to do with Rails and Ruby in general so far, OmniAuth is designed to make our lives as developers all that much easier. One of my biggest issues in getting started with something is having to deal with the monotonous grind that is boilerplate code, and implementing the same thing again and again for each new project (especially authentication).

Authentication for different systems is broken up into modular strategies, which handle the intricacies and plug back into the main OmniAuth ecosystem. This allows you to very quickly (and very flexibly) add authentication for a whole plethora of cool things such as:

* [Facebook](https://github.com/mkdynamic/omniauth-facebook)
* [Twitter](https://github.com/arunagw/omniauth-twitter)
* [Github](https://github.com/intridea/omniauth-github)
* [and so many, many more..](https://github.com/intridea/omniauth/wiki/List-of-Strategies) (143 as I was writing this)

Admittedly, getting myself up and running took a little work (which was mostly due to me learning Rails at the same time, probably not enough sleep, aaaaaand probably only slightly because I was following the tutorials out of order.. whoops..), but it was still WORLDS less than what I would have had to do to implement a comparable (or even half as good system) by myself.

Definitely check it out and give it a try in your next project, might save you a few hours that could be better spent hacking on something else!

As far as tutorials/resources, [Google is Your Friend&trade;](https://www.youtube.com/watch?v=ftQ6A3DKKeg), but here are some starters:

* [OmniAuth@GitHub](https://github.com/intridea/omniauth)
* [OmniAuth Wiki@GitHub](https://github.com/intridea/omniauth/wiki)
* [Community maintained list of strategies](https://github.com/intridea/omniauth/wiki/List-of-Strategies)
* [RailsCasts](http://railscasts.com/)
  * [#235 OmniAuth Part 1](http://railscasts.com/episodes/235-omniauth-part-1)
  * [#236 OmniAuth Part 2](http://railscasts.com/episodes/236-omniauth-part-2)
  * [#241 Simple OmniAuth](http://railscasts.com/episodes/241-simple-omniauth)
  * [#304 OmniAuth Identity](http://railscasts.com/episodes/304-omniauth-identity)

## [stealthmode]

So this section was going to be all about the website/webapp, why I decided to make it, what it does/will do, a link to it, etc. I was holding off on publishing this post till it went live, but due to some recent developments/talks about the projects possible futures I've decided to hold back on this section for the time being. Will update/link to a new post in the future!

Sooo.. for now, enjoy my new website that exists only on my devbox.. in stealthmode!! http://localhost:5000 (Unnecessary note: That link isn't going to work for you guys.. :p)

## Oh My!

I don't actually really have anything new or interesting to say here.. aside from that with this subtitle I have now completed the pun set out by this post's title. Winnar!
