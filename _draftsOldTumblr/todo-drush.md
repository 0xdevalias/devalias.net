# TODO: Drush

Tagged: drush, drupal, archive-dump, ard, archive-backup, arb, archive-restore, arr, cache-clear, cc, pm-update, up, productivity.

TODO: tl;dr
TODO: Post about drush, what it is, why it's cool, and some quick setup info.

## Installing/Updating/Uninstalling Drush

Installing Drush with pear is pretty straightforward. All you need to do is open up your command line (or ssh to your server) and issue the following commands:

<pre>
pear channel-discover pear.drush.org
pear install drush/drush
</pre>

Now restart/reload your shell and see if it worked:

<pre>
[user@server ~]# drush --version
 Drush Version   :  6.0
</pre>

Want to update it? Easy:

<pre>
pear upgrade drush/drush
</pre>

Uninstalling through pear is just as simple too:

<pre>
pear uninstall drush/drush
</pre>

Take a look at the [Drush GitHub Repository](https://github.com/drush-ops/drush#install---pear) for full pear (and manual) installation instructions.

## TODO: Setting up aliases/remote/etc

Ref: http://drush.ws/examples/example.aliases.drushrc.php

Two options (one with db/passwords, one without)

<pre>
drush site-alias @self
drush site-alias @self --with-db --show-passwords
</pre>

## TODO: Some common/useful quick reference commands

TODO: General introduction. Mention that 2 commands are shown used on a site alias and without.

* [archive-dump](http://drush.ws/#archive-dump) – Backup your code, files, and database into a single file. (Aliases: ard, archive-backup, arb)

<pre>
drush archive-dump

drush @mysite archive-dump
</pre>

* [archive-restore](http://drush.ws/#archive-restore) – Expand a site archive into a Drupal web site. (Aliases: arr)

<pre>
drush archive-restore

drush @mysite archive-restore
</pre>

* [cache-clear](http://drush.ws/#cache-clear) – Clear a specific cache, or all drupal caches. (Aliases: cc)

<pre>
drush cache-clear

drush @mysite cache-clear
</pre>

* [pm-update](http://drush.ws/#pm-update) – Display available update information for Drupal core and all enabled projects and allow updating to latest recommended releases. Also apply any database updates required. (Aliases: up)

<pre>
drush  pm-update

drush @mysite pm-update
</pre>

## References

* **Quick Reference**
  * http://drush.ws/ – The official drush website.
  * http://drush.ws/examples/example.aliases.drushrc.php
  * https://github.com/drush-ops/drush – The official Drush GitHub repository.
* **Other reference materials**
  * http://scotthadfield.ca/2011/10/04/9-drush-links-take-you-beginner-advanced
  * http://2tbsp.com/content/introduction-drupals-command-line-shell-interface-drush
  * http://cognimatic.com/blog/robert-carr/12/02/09/install-drupal-remotely-ssh-drush
  * http://deeson-online.co.uk/labs/drupal-drush-aliases-and-how-use-them
  * https://www.digitalocean.com/community/articles/how-to-migrate-and-sync-drupal-sites-with-drush
  * https://drupal.org/node/670460
  * http://drupal.stackexchange.com/questions/32795/how-to-use-drush-in-remote-server