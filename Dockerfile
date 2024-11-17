# 1 Set master image
FROM php:8.3.13-apache

# 2 Set working directory
WORKDIR /var/www/html

# 3 Add and enable Extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN docker-php-ext-enable pdo pdo_mysql mysqli

# 4 Server settings
RUN echo "ServerName php-server" >> /etc/apache2/apache2.conf

# 5 Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www/html

# 6 Setting user to www-data
USER www-data

# 7 Export port 80
EXPOSE 80