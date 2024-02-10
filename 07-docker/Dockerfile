FROM debian:stable

RUN apt update && apt install -y apache2 php libapache2-mod-php && apt clean && mkdir /var/www/dynamic 

RUN echo '<VirtualHost *:80> \n \
    ServerName dynamic \n \
    ServerAlias www.dynamic \n \
    ServerAdmin webmaster@localhost \n \
    DocumentRoot /var/www/dynamic \n \
    ErrorLog ${APACHE_LOG_DIR}/error.log \n \
    CustomLog ${APACHE_LOG_DIR}/access.log combined \n \
</VirtualHost>' > /etc/apache2/sites-available/001-dynamic.conf
RUN echo '<html> \n \
<head> \n \
 <title>Site is running PHP version <?=phpversion();?></title> \n \
</head> \n \
 <body> \n \
  <?php \n \ 
    $limit = rand(1, 1000); \n \
    for ($i=0; $i<$limit; $i++){ \n \
    echo "<p>Hello, world!</p>"; \n \
    } \n \
  ?> \n \
 </body> \n \
</html>' > /var/www/dynamic/index.php 

RUN chown -R www-data:www-data /var/www/dynamic && chmod 0755 /var/www/dynamic && chmod 0744 /var/www/dynamic/index.php &&\
a2dissite 000-default && a2ensite 001-dynamic
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
#ENTRYPOINT ["/bin/bash"]
