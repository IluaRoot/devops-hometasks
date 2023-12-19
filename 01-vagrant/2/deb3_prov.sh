#!/bin/bash

echo "apt updating"
apt update

echo "install Nginx and php7.4"
apt -y install nginx php7.4-fpm

echo "setting up nginx conf file"

echo "disabling default nginx conf file"
rm -rf /etc/nginx/sites-enabled/default

if [[ -f /etc/nginx/sites-available/deb3.conf ]]
 then
    echo "file deb3.conf already exist"
 else
        cat > /etc/nginx/sites-available/deb3.conf << EOF
            server {
            listen 80;
            server_name vagrant0122task;
            root /var/www/vag122;
                location / {
                    try_files \$uri \$uri/ /index.php?\$query_string;
                    index index.php;
                }
                location ~* \.php$ {
                    try_files \$uri = 404;
                    fastcgi_split_path_info ^(.+\.php)(/.+)$;
                    fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
                    fastcgi_index index.php;
                    fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
                    include fastcgi_params;
                }
            }
EOF
    ln -s /etc/nginx/sites-available/deb3.conf /etc/nginx/sites-enabled/
fi

if [[ -d /var/www/vag122 ]]
 then
    echo "directory vag122 already exist"
 else
    mkdir /var/www/vag122
fi

echo "copy file"
if [[ -f /var/www/vag122/index.php ]]
 then
    echo "file index.php is already on a place"
else
    cp /home/vagrant/files/index.php /var/www/vag122/
fi

echo "Files owner"
chown -R www-data:www-data /var/www/

echo "reload nginx"
nginx -s reload

echo "deb3 set up and ready to use"
