FROM php:7.2-apache

MAINTAINER Moises Heberle <moiseh@gmail.com>
MAINTAINER William Prigol Lopes <william.prigol.lopes@gmail.com>

RUN apt-get update && apt-get install -y wget libssl-dev libfreetype6-dev libjpeg62-turbo-dev \
        libmagickwand-dev imagemagick ghostscript --no-install-recommends \
        libpng-dev libxml2-dev zlib1g-dev libicu-dev g++ \
        git vim curl sshpass \
    && docker-php-ext-install -j$(nproc) iconv zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-install soap \
    && pecl install imagick \
    && docker-php-ext-enable imagick

RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql gd

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN a2enmod rewrite
RUN a2enmod alias
RUN a2enmod headers
RUN a2enmod ssl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
