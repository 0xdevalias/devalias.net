---
layout: post
title: wp-cli - Like Drush but for Wordpress
date: '2013-10-30T15:00:30-07:00'
tags:
- drush
- wordpress
- drupal
- wp-cli
- blog
tumblr_url: http://blog.devalias.net/post/65497370109/wp-cli-like-drush-but-for-wordpress
---
So there’s this cool little tool I came across, similar in function to Drush (which is an awesome tool for Drupal that you should totally use), but for Wordpress. It’s called wp-cli

Installing wp-cli

As seems to be common with tools these days, installation is really quick and painless. Just fire up your favourite shell and enter the following.


curl https://raw.github.com/wp-cli/wp-cli.github.com/master/installer.sh | bash


You might want to install it to a custom path and then link it instead


curl http://wp-cli.org/installer.sh > installer.sh
sudo INSTALL_DIR=''/usr/share/wp-cli'' bash installer.sh
sudo ln -s /usr/share/wp-cli/bin/wp /usr/bin/wp


If you’re on OSX and running Homebrew then you can use that instead!


brew tap josegonzalez/homebrew-php
brew install wp-cli


Using wp-cli to install Wordpress

There are tons of command line options available to wp-cli (and even more that have been contributed by the community), so I will just give the tl;dr version I used to setup a new blog here.

In your favourite shell, cd to the installation directory and download a new copy of Wordpress.


cd /my/site/directory
wp core download --version=3.6.1


Next we’ll need to set up the options in the config file.


wp core config --dbname=mydatabase --dbuser=myusername --dbpass=mysecurepassword


Finally, run through the install to setup the database and everything else.


wp core install --url=mydomain.example.com --title="My Example Blog" --admin_user=myadminusername --admin_password="myadminpassword" --admin_email="myname@example.com"


And that’s it! Happy hacking!
