FROM php:8.5-fpm
RUN apt-get update \
    && apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

RUN apt-get update \
    && apt-get install -y sendmail libpng-dev

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev

RUN apt-get install -y libzip-dev
RUN docker-php-ext-install zip


RUN docker-php-ext-install gd

RUN apt-get -y update && \
  apt-get install -y libicu-dev && \
  docker-php-ext-configure intl \
  && docker-php-ext-install intl