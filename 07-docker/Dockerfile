FROM debian:stable

RUN apt update && apt install -y apache2 php libapache2-mod-php && apt clean && mkdir /var/www/dynamic 

COPY files/index.php files/index.html /var/www/dynamic/
COPY files/001-dynamic.conf /etc/apache2/sites-available/001-dynamic.conf

RUN a2dissite 000-default && a2ensite 001-dynamic && mv /var/www/dynamic/index.html /var/www/dynamic/index.html_off && chown -R www-data:www-data /var/www/dynamic

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]