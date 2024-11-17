# 1 Set master image
FROM php:8.3.13-apache

# 2 Set working directory
WORKDIR /var/www/html

# 3 Install dependencies for curl
RUN apt-get update && apt-get install -y libcurl4-openssl-dev

# 4 Add and enable Extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli curl
RUN docker-php-ext-enable pdo pdo_mysql mysqli curl

# 5 Server settings
RUN echo "ServerName php-server" >> /etc/apache2/apache2.conf

# 6 Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www/html

# 7 Setting user to www-data
USER www-data

# 8 Export port 80
EXPOSE 80