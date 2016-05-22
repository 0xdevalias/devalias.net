# Installing SSLH (MediaTemple, Plesk, Apache, Nginx)

Tagged: sslh, ssl, ssh, https, install, how to, Plesk, mediatemple, nginx, apache.

TODO: Instructions on how to setup on mediatemple

**tl;dr**
TODO: Put this in a gist?
**1 - Install RPMForge Repo (if required)**
wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
rpm -K rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
rpm -i rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
**2 - Install SSLH**
yum install sslh

/etc/init.d/sslh is already setup for you
Configuration at /etc/sysconfig/sslh



**How to add RPMForge to yum**

http://wiki.centos.org/AdditionalResources/Repositories/RPMForge#head-5aabf02717d5b6b12d47edbc5811404998926a1b

**How to install SSLH**

(Main install/info guide)
http://simongoudie.com/blog/2012/06/03/sharing-port-443-between-ssl-and-ssh-using-sslh.html

(Add SSLH as a service, check port 443) http://blog.mythictechnologies.com/2011/10/12/accepting-ssl-and-ssh-traffic-on-the-same-port-with-sslh/

http://cxwangyi.wordpress.com/2012/12/25/run-both-sshd-and-nginx-on-port-80/

Changing apache/nginx port/etc for parallels plesk 11
http://download1.parallels.com/Plesk/PP11/11.0/Doc/en-US/online/plesk-linux-advanced-administration-guide/index.htm?fileName=68693.htm