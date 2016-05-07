FROM php:5.6-fpm
RUN apt-get update && apt-get install -y git zlibc zlib1g-dev zlib1g libmemcached-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libicu-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd zip mbstring mysqli pdo pdo_mysql intl
RUN cp /usr/src/php/php.ini-production /usr/local/etc/php/php.ini
