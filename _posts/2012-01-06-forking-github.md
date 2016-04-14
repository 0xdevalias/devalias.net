---
layout: post
title: Forking Github!! (or how to contribute to a project)
date: '2012-01-06T12:36:18+10:00'
tags:
- git
- github
- clone
- fork
categories:
- devalias
tumblr_url: http://devalias.tumblr.com/post/15337594635/forking-github-or-how-to-contribute-to-a
redirect_from: /post/15337594635/forking-github-or-how-to-contribute-to-a
---
I've been following the GitHub craze for a little while now, and finally coming to a stage where I would like to start contributing to some of the projects I follow. Having looked closely at the examples for one in particular, I noticed something simple, but beneficial that I could add, so I set out to become an active member of the internet!

I forked the repository, synced it down to my computer, made the changes, created a pull request, and got it merged with the main code. Win!!

It wasn't until a week or two later that I was reading an article that mentioned creating pull requests from your main repos wasn't really the best idea. Woops. So, to remind myself, and hopefully help some others out in the process, I'm documenting what is the 'proper' (if such a thing exists) process for forking.

1. **Fork/clone the project reposistory** - Every story needs a place to start, and ours starts at the repos we want to contribute to. Fork/clone the repository to somewhere you can play around with it.
2. **Create a new branch on your fork/clone** - Now here is where I went wrong. Create a new branch (`git branch [blah]`) on your fork/clone and check it out (`git checkout [blah]`) before making any changes to the code. This way the changes you make will be isolated in your branch and won't mess up the master branch (that you pulled down from the original repository)
3. **Make your changes** - Make whatever changes you want/need/feel the desire to make. The world is your oyster. Remember that the original code is sitting in the master branch in case you need to wipe everything out and start again.
4. **Commit your changes** - Make sure to commit the changes you make to your branch, otherwise they aren't going to go anywhere! Also, make sure you push your local branch back up to GitHub.
5. **Create a pull request** - Go to GitHub and create a pull request from your branch for the original project to incorporate your changes.

Hopefully theres enough info here to at least set you on the right track to contributing if (when! do it, you know you want to..) you start contributing to open source projects.

## Sources

* https://github.com/primalmotion/Archipel/wiki/Developer%3A-Contributing
