---
layout: post
title: MDwiki (and how to get started)
date: '2014-07-24T03:12:31+10:00'
tags:
- mdwiki
- wiki
- clientside
- tutorial
- markdown
- github
- gh-pages
tumblr_url: http://devalias.tumblr.com/post/92579952637/mdwiki-and-how-to-get-started
redirect_from: /post/92579952637/mdwiki-and-how-to-get-started
---
(Note: Original gist can be found [here](https://gist.github.com/alias1/a8c3c2fd7bf2f50ff666))

If you haven't already heard about it, [MDwiki](https://dynalon.github.io/mdwiki/#!index.md) is a cool little CMS/Wiki that runs entirely clientside (HTML5/Javascript) and uses [Markdown](https://en.wikipedia.org/wiki/Markdown)

Since it's all clientside, we can do really cool things like track our changes in git and then host it all on [GitHub Pages](https://pages.github.com/). That means super simple forking, contributing and sharing. Yay for open source!

## Setting up MDwiki with GitHub

There is an [official guide](https://dynalon.github.io/mdwiki/#!tutorials/github.md) available on the MDwiki site, but I kind of like to do things my own way, so below is how I go about setting up a new site. (I'll assume you're already setup on GitHub and know vaguely how to use it, if not, maybe checkout the guide above)

* On GitHub
  * [Create a new repository](https://github.com/new) and name it what you want (eg. `my-mdwiki`)
* Setup initial MDwiki bits
  * [Download the latest MDwiki release](https://github.com/Dynalon/mdwiki/releases)
  * Extract it to a folder (eg. `my-mdwiki`)
  * Here you have a choice:
    * `mdwiki.html` will give you MDwiki and all of it's libraries packaged as a single file
  	* `mdwiki-slim.html` (my preference) will give you MDwiki, but load it's libraries from a CDN (content delivery network)
  * Choose the option you want to use and rename it to `index.html`
  * Next we'll need to create a `config.json` file. You can [read about how this works](https://dynalon.github.io/mdwiki/#!customizing.md) or just use something similar to mine:

```json
{
"lineBreaks": "gfm",
"additionalFooterText": "By <a href='http://www.devalias.net/'>Glenn '/dev/alias' Grant</a><br />",
"anchorCharacter": "&para;"
}
```

* Almost there, create a quick `navigation.md` ([docs](https://dynalon.github.io/mdwiki/#!quickstart.md)) that looks something like

```
# Your wiki name

[Home](index.md)
[About](about.md)
[Download](download.md)
```

And create your first page (i'll only show you one, but the process is the same). Create a file called `index.md` (as specified in your navigation)

```
# Hello World!

This is my first page!
```

* That's it for the basic site setup!
* As a little bonus, I like to add a script to run a `python SimpleHTTPServer` for local testing called `run-pyserver.sh` (and make sure to make it executable with `chmod +x run-pyserver.sh`)

```bash
#!/bin/bash

open http://localhost:8000
python -m SimpleHTTPServer 8000
```

* Now we'll setup our git repo:
  * Open a terminal window, and navigate to the folder you just created (eg. `cd ~/my-mdwiki`)
  * Initialise the git repo: `git init`
  * Here we use some [magic](http://www.retrologic.com/jargon/M/magic.html) (from [Sean Estabrooks](http://git.661346.n2.nabble.com/how-to-start-with-non-master-branch-tt3284326.html#a3284821)) to tell git to call the initial branch `gh-pages` instead of `master`: `git symbolic-ref HEAD refs/heads/gh-pages`
  * Add all the files we've created so far: `git add .`
  * Commit them: `git commit -m "Initial Commit"`
  * Add your GitHub repo as a remote (making sure to replace `YOURUSERNAME` with your actual username, and `my-mdwiki` with the name of the repository you created earlier): `git remote add origin git@github.com:YOURUSERNAME/my-mdwiki.git`
  * Then push it to github: `git push -u origin gh-pages`
* That's pretty much it! After a short delay, your site should be available at http://YOURUSERNAME.github.io/my-mdwiki
