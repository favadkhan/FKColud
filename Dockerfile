<<<<<<< HEAD

FROM docker/whalesay:latest

COPY apt.conf /etc/apt/  

=======
FROM ubuntu:12.04
>>>>>>> 48b70b913d0f791564d870e10a8341cab63b99fd

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y git curl apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysql

# Install app
RUN rm -rf /var/www/*
ADD src /var/www

# Configure apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
