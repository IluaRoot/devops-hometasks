FROM debian:stable

RUN apt update && apt install -y apache2 php libapache2-mod-php && apt clean
RUN mkdir /var/www/dynamic

COPY files/001-dynamic.conf /etc/apache2/sites-available/
COPY files/index.php /var/www/dynamic/

RUN chown -R www-data:www-data /var/www/dynamic

RUN a2dissite 000-default && a2ensite 001-dynamic && service apache2 start
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]