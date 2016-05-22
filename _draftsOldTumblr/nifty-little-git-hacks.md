# Nifty Little Git Hacks

git config --global ....
  Set default repo origin, branch master

--------------------

With git 1.7.9 or later, you can just do:

git config --global credential.helper cache
... which tells git to keep your password cached in memory for (by default) 15 minutes. You can set a longer timeout with:

git config credential.helper 'cache --timeout=3600'
(That example is suggested in the GitHub help page for Linux.) GitHub's help also suggests that if you're on Mac OS and used homebrew to install git, you can use the native Mac OS keystore with:

git config --global credential.helper osxkeychain
... and there is a similar helper for Windows, called git-credential-winstore.exe.

http://stackoverflow.com/questions/5343068/is-there-a-way-to-skip-password-typing-when-using-https-github