FROM php:7.2-fpm

ARG APP_ENV

# Install system packages for PHP extensions recommended
RUN apt-get update && \
    apt-get -y install \
        gnupg2 && \
    apt-key update && \
    apt-get update && \
    apt-get -y install \
            g++ \
            git \
            curl \
            imagemagick \
            libcurl3-dev \
            libicu-dev \
            libfreetype6-dev \
            libjpeg-dev \
            libjpeg62-turbo-dev \
            libmagickwand-dev \
            libpq-dev \
            libpng-dev \
            libxml2-dev \
            libzip-dev \
            zlib1g-dev \
            mysql-client \
            openssh-client \
            nano \
            unzip \
            libcurl4-openssl-dev \
            libssl-dev \
        --no-install-recommends && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install PHP extensions required for Yii 2.0 Framework
RUN docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-configure bcmath && \
    docker-php-ext-install \
        soap \
        zip \
        curl \
        bcmath \
        exif \
        gd \
        iconv \
        intl \
        mbstring \
        opcache \
        pdo_mysql \
        pdo_pgsql

# Install PECL extensions
#RUN printf "\n" | pecl install \
#        imagick \
#        mongodb && \
#    docker-php-ext-enable \
#        imagick \
#        mongodb

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Install supervisor && cron
RUN \
  apt-get update && \
  apt-get install -y supervisor cron && \
  rm -rf /var/lib/apt/lists/*

# Application environment
WORKDIR /api

#setup autoload scrypt
COPY ./init.sh /etc/init.d/

RUN chmod +x /etc/init.d/init.sh && update-rc.d init.sh defaults

CMD ["/etc/init.d/init.sh", "sh"]