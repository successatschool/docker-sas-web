FROM php:7.2-apache

# System packages
RUN apt-get update -qq  \
 && apt-get install -y build-essential cmake git-core libicu-dev libjpeg62-turbo-dev libmemcached-dev libmemcached11 libmemcachedutil2 libpng-dev libz-dev vim-tiny ssh wget unzip \
 && rm -rf /var/lib/apt/lists/* /var/cache/apk/*

# Apache configuration
COPY config/ecs.conf /etc/apache2/sites-available/
COPY config/ssl-local.conf /etc/apache2/sites-available/

RUN a2enmod rewrite \
 && a2enmod ssl \
 && a2enmod headers \
 && a2dissite 000-default \
 && a2ensite ssl-local \
 && echo ServerName localhost >> /etc/apache2/apache2.conf

# PECL / extension builds and install
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/
RUN pecl install apcu \
 && docker-php-ext-enable apcu \
 && docker-php-ext-install bcmath gd intl opcache pcntl pdo_mysql sockets

# Manual build needed to get memcache extension support on PHP 7.2
# See https://stackoverflow.com/a/48380759/2803757 and https://github.com/LeaseWeb/LswMemcacheBundle#requirements
RUN cd /usr/local/src/ \
 && wget https://github.com/websupport-sk/pecl-memcache/archive/NON_BLOCKING_IO_php7.zip \
 && unzip NON_BLOCKING_IO_php7.zip \
 && mv pecl-memcache-NON_BLOCKING_IO_php7 pecl-memcache-NON_BLOCKING_IO_php72 \
 && cd pecl-memcache-NON_BLOCKING_IO_php72 \
 && phpize \
 && ./configure --enable-memcache \
 && make \
 && cp modules/memcache.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718 \
 && echo 'extension=memcache.so' > /usr/local/etc/php/conf.d/docker-php-ext-manual-memcache.ini

# PHP configuration
COPY config/php.ini /usr/local/etc/php/

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Composer parallel install plugin
RUN composer global require hirak/prestissimo
