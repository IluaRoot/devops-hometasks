#!/bin/bash

apt update
apt -y install nginx php7.4-fpm

echo "Creating directory for web server"
if [[ -d /var/www/vag11 ]]
    then
        echo "Directory is already exist"
    else
        mkdir /var/www/vag11
    fi

if [[ -d /var/www/vag12 ]]
    then
        echo "Directory is already exist"
    else
        mkdir /var/www/vag12
    fi

echo "copy files"
cp /home/vagrant/files/index.html /var/www/vag11/
cp /home/vagrant/files/index.php /var/www/vag12/

chown -R www-data:www-data /var/www/
cp /home/vagrant/files/*.conf /etc/nginx/sites-available/


ln /etc/nginx/sites-available/*.conf /etc/nginx/sites-enabled/

echo "reload nginx"
nginx -s reload