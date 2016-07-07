---
layout: post
title: "QuickNote: Access Files from other Time Machine backups"
tags:
- quicknote
- "creativetechs.com"
- "apple.stackexchange.com"
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---

There are two main methods for accessing files from other Time Machine backups:

1. Using Time Machine
2. Accessing the backup file directly

Before we get started, if you're using Time Capsule or a network volume for backup, you first need to navigate to the backup location and double click to mount the `.sparsebundle`. (it may ask you for a password if the backup is encrypted) Once that's done, continue as normal below.

## Using Time Machine

* Hold alt/option
* Click on the Time Maching (backup) icon in the menu bar
* Select "Browse Other Backup Disks..."
* Select the backup you want to browse.

## Accessing the backup file directly

Unfortunately while trying to access my old machine's backup file, the above method didn't want to work for me. Luckily, we can get access to the files the good old fashioned manual way!

* Locate and mount the `.sparsebundle`
* Navigate to the `Backups.backupdb/yourmachinename/Latest` folder
* Enjoy!

## References

* http://www.creativetechs.com/tipsblog/access-files-from-other-time-machine-backups/
* https://apple.stackexchange.com/questions/158645/recover-certain-files-from-time-machine-from-previous-mac