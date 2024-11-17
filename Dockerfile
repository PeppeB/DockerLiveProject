# 1 Set master image
FROM php:8.3.13-apache

# 2 Set working directory
WORKDIR /var/www/html

# 3 Install dependencies for curl
RUN apt-get update && apt-get install -y libcurl4-openssl-dev

# 4 Install dependencies for gd
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev 

# 5 Configure the GD extension to include support for JPEG and FreeType image formats
RUN docker-php-ext-configure gd --with-freetype --with-jpeg

# 6 Add and enable Extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli curl gd
RUN docker-php-ext-enable pdo pdo_mysql mysqli curl gd

# 7 Server settings
RUN echo "ServerName php-server" >> /etc/apache2/apache2.conf

# 8 Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www/html

# 9 Setting user to www-data
USER www-data

# 10 Export port 80
EXPOSE 80