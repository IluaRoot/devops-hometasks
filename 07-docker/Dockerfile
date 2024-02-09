FROM debian:stable

RUN apt update && apt install -y apache2 php libapache2-mod-php && apt clean && mkdir /var/www/dynamic 

RUN <<EOF cat > /etc/apache2/sites-available/001-dynamic.conf
<VirtualHost *:80>
    ServerName dynamic
    ServerAlias www.dynamic
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/dynamic
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
RUN <<EOF cat > /var/www/dynamic/index.php 
<html>
<head>
 <title>Site is running PHP version <?=phpversion();?></title>
</head>
 <body>
  <?php
    \$limit = rand(1, 1000);
    for (\$i=0; \$i<\$limit; \$i++){
    echo "<p>Hello, world!</p>"; 
    }
  ?> 
 </body>
</html>
EOF

#RUN <<EOF cat > /var/www/dynamic/index.html_dis
#<html>
#  <head>
#    <title>Success!</title>
#  </head>
# <body>
#    You Vagrantfile is fine if you can see this message.
#  </body>
#</html>
#EOF


RUN chown -R www-data:www-data /var/www/dynamic && chmod 0755 /var/www/dynamic && chmod 0744 /var/www/dynamic/index.php &&\
a2dissite 000-default && a2ensite 001-dynamic
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]