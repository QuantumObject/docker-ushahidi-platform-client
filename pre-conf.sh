#!/bin/bash

#trying to change from git clone to downloading directly from zip ....

cd /var/www
#git clone https://github.com/ushahidi/platform-client.git
wget https://github.com/ushahidi/platform-client/archive/v4.4.2.zip
unzip v4.4.2.zip -d  /var/www/platform-client
rm v4.4.2.zip

cd /var/www/platform-client 
chown -R www-data:www-data /var/www/platform-client  /var/log/apache2

#git checkout develop
#npm install -g gulp
#npm install

a2enmod rewrite
a2enmod headers
rm -R /var/www/html

#to fix error relate to ip address of container apache2
echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
