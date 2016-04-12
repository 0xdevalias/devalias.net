---
layout: post
title: wp-cli - Like Drush but for Wordpress
date: '2013-10-31T09:00:30+11:00'
tags:
- wp-cli
- wordpress
- drush
- drupal
- blog
tumblr_url: http://devalias.tumblr.com/post/65497370109/wp-cli-like-drush-but-for-wordpress
redirect_from: /post/65497370109/wp-cli-like-drush-but-for-wordpress
---
So there's this cool little tool I came across, similar in function to [Drush](http://www.drush.org/en/master/) (which is an awesome tool for [Drupal](https://www.drupal.org/) that you should totally use), but for [Wordpress](https://wordpress.org/). It's called [wp-cli](http://wp-cli.org/)

## Installing wp-cli

As seems to be common with tools these days, installation is really quick and painless. Just fire up your favourite shell and enter the following.

```
curl https://raw.github.com/wp-cli/wp-cli.github.com/master/installer.sh | bash
```

You might want to install it to a custom path and then link it instead

```
curl http://wp-cli.org/installer.sh > installer.sh
sudo INSTALL_DIR=''/usr/share/wp-cli'' bash installer.sh
sudo ln -s /usr/share/wp-cli/bin/wp /usr/bin/wp
```

If you're on OSX and running [Homebrew](http://brew.sh/) then you can use that instead!

```
brew tap josegonzalez/homebrew-php
brew install wp-cli
```

## Using wp-cli to install Wordpress

There are tons of [command line options](http://wp-cli.org/commands/) available to wp-cli (and even more that have been [contributed by the community](https://github.com/wp-cli/wp-cli/wiki/List-of-community-commands)), so I will just give the tl;dr version I used to setup a new blog here.

In your favourite shell, cd to the installation directory and [download](http://wp-cli.org/commands/core/download/) a new copy of Wordpress.

```
cd /my/site/directory
wp core download --version=3.6.1
```

Next we'll need to set up the options in the [config](http://wp-cli.org/commands/core/config/) file.

```
wp core config --dbname=mydatabase --dbuser=myusername --dbpass=mysecurepassword
```

Finally, run through the [install](http://wp-cli.org/commands/core/install/) to setup the database and everything else.

```
wp core install --url=mydomain.example.com --title="My Example Blog" --admin_user=myadminusername --admin_password="myadminpassword" --admin_email="myname@example.com"
```

And that's it! Happy hacking!
