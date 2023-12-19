#!/bin/bash

echo "apt updating"
apt update

echo "install Nginx"
apt -y install nginx

echo "setting up nginx conf file"

echo "disabling default nginx conf file"
rm -rf /etc/nginx/sites-enabled/default

if [[ -f /etc/nginx/sites-available/deb2.conf ]]
 then
    echo "file deb2.conf already exist"
 else
        cat > /etc/nginx/sites-available/deb2.conf << EOF
        server {
        listen 80;
        server_name vagrant0121task;
        root /var/www/vag121;		
            location / {
            autoindex on;
            index index.htm index.html;
            }
        }
EOF
    ln -s /etc/nginx/sites-available/deb2.conf /etc/nginx/sites-enabled/
fi

if [[ -d /var/www/vag121 ]]
 then
    echo "directory vag121 already exist"
 else
    mkdir /var/www/vag121
fi

echo "copy file"
if [[ -f /var/www/vag121/index.html ]]
 then
    echo "file index.html is already on a place"
else
    cp /home/vagrant/files/index.html /var/www/vag121/
fi

echo "Files owner"
chown -R www-data:www-data /var/www/*

echo "reload nginx"
nginx -s reload

echo "deb2 set up and ready to use"
