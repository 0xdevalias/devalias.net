# Securing Apache HTTP Headers and Hardening Tips

Tagged: apache, httpd, hardening, secure, config, configuration, http, headers, mod_headers, headers_module, HTTPD_ROOT, SERVER_CONFIG_FILE, httpd.conf, ServerSignature, ServerTokens, ProxyVia, X-Powered-By, X-Mod-Pagespeed, X-AspNet-Version, X-Generator, X-Drupal-Cache, X-Varnish, X-Varnish-Cache, server-status, server-info.


**tl;dr** Apache config */etc/httpd/httpd.conf*, LoadModule headers_module modules/mod_headers.so, ServerSignature Off, ServerTokens Prod, ProxyVia block, Header unset X-FooHeader, Header set X-BarHeader

Originally this information was going to be included in my earlier post [*What vulnerabilities are your HTTP headers announcing to the world?*](http://devalias.net/#TODOCHANGEME), but since it got so long I decided to split it into it's own post. This will show you how to remove/obfuscate Apache HTTP response headers, as well as providing a few Apache configuration security hardening tips.

### Apache

First you need to check whether you have [mod_headers](http://httpd.apache.org/docs/current/mod/mod_headers.html) installed. Probably the easiest way to do this via command line is:

<pre>httpd -M</pre>

You should see *headers_module* somewhere in the list of output if you've got it setup correctly. If it's not there, you'll need to load it in your httpd config file. On the command line again:

<pre>httpd -V</pre>

You're looking for *HTTPD_ROOT* and *SERVER_CONFIG_FILE*:

<pre>
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"
</pre>

With their powers combined, you get the location of your httpd config file! (In this case, */etc/httpd/conf/httpd.conf*) Now you just need to edit this file to add in the following line (stick it near all the other loads, or uncomment it if it's already there)

<pre>LoadModule headers_module modules/mod_headers.so</pre>

Double check with *httpd -M* to see that it updated (you might need to do a *service httpd restart* for it to take effect)

**Server Generated Footers (ServerSignature)**

Next we go back to your *httpd.conf* file. [*ServerSignature*](http://httpd.apache.org/docs/current/mod/core.html#serversignature) allows you to disable the footer Apache adds to server generated documents (error pages, directory listings, etc) Note that content of this footer is controlled by the *ServerTokens* setting shown next.

<pre>
ServerSignature Off  
</pre>

**Server Header (ServerTokens)**

To fix up the server header so that it no longer displays version information you'll be wanting [ServerTokens](http://httpd.apache.org/docs/current/mod/core.html#servertokens)

<pre>
ServerTokens Prod
</pre>

While there are other options you can specify (Full, Major, Minor, Minimal, OS), Prod (or ProductOnly) is the safest as it doesn't reveal ANY version information (though it will still tell them you are using Apache)

**Via Headers (ProxyVia)**

One more option that you may be interested in at this stage is *ProxyVia*. This option controls whether to show the *Via* response header, and depending on your particular setup it may not be relevant. Though to make sure you're not giving out any details that could help a would be attacker, you can block this too.

<pre>ProxyVia block</pre>

**Unset/Modify Headers**

There are a number of additional headers that can be included by software running on your server which you may want to remove or obfuscate. Some of these include *X-Powered-By, X-Mod-Pagespeed, X-AspNet-Version, X-Generator, X-Drupal-Cache, X-Varnish, X-Varnish-Cache, etc.* These can easily be unset, or set to some arbitrary value if you choose (though be careful as some may actually be required depending on your software stack). See [mod_headers](http://httpd.apache.org/docs/current/mod/mod_headers.html) for more information.

<pre>
<IfModule mod_headers.c>
  Header unset Server
  Header unset X-Powered-By
  Header unset X-Mod-Pagespeed
  Header set X-DevAlias-Net HackThePlanet
</IfModule>
</pre>

**Aliases and Virtual Directories**

This next step isn't related to the response headers at all, but it's yet another way a potential attacker could gather version and software information from your server. Apache lets you configure aliases, which maps URLs to file system locations. By default there tends to be an alias defined for */icons/*, which contains various icons/images that are used by the server/webpages (eg directory listings). By looking at these icons, or fingerprints of them, an attacker may be able to determine your version of Apache or installed modules. You will see something like below

<pre>
Alias /icons/ "/var/www/icons/"

<Directory "/var/www/icons">
    Options Indexes MultiViews
    AllowOverride None
    Order allow,deny
    Allow from all
</Directory>
</pre>

You want to comment out these lines, then save your conf file and *service httpd restart*.

<pre>
#Alias /icons/ "/var/www/icons/"
#
#<Directory "/var/www/icons">
#    Options Indexes MultiViews
#    AllowOverride None
#    Order allow,deny
#    Allow from all
#</Directory>
</pre>

Two more locations that you definitely want to comment out/restrict access to are */server-status* and */server-info*

<pre>
<Location /server-status>
    SetHandler server-status
    Order deny,allow
    Deny from all
    Allow from .example.com
</Location>
</pre>

<pre>
<Location /server-info>
    SetHandler server-info
    Order deny,allow
    Deny from all
    Allow from .example.com
</Location>
</pre>

### References/Further Readings

* [Apache Header Obfuscation/Removal](http://www.securesauce.com/?p=5)
* [Unset/Remove Apache Response Header](http://www.shanison.com/2012/07/05/unset-apache-response-header-protect-your-server-information/)