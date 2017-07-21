#!/bin/bash

# Apache
yum install -y httpd httpd-devel http-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# Download Stater Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/astrix2001/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/astrix2001/vagrant/master/files/info.php

service httpd restart