

FROM docker/whalesay:latest

COPY apt.conf /etc/apt/  

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y git curl apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysql

# Install app
RUN rm -rf /var/www/*
ADD src /var/www/html


#ADD 000-default.conf /etc/apache2/sites-available
#RUN ln -s /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-enabled/000-default.conf
# Configure apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www/html
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2$SUFFIX
ENV APACHE_PID_FILE /var/lock/apache2.pid
EXPOSE 80

CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
