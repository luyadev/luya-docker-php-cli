FROM php:7.2-cli

# Install all LUYA depending packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libicu-dev \
        libpq-dev \
        libxslt1-dev \
        libmemcached-dev \
        curl \
        locales \
    && docker-php-ext-install -j$(nproc) iconv mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql intl zip exif \
    && apt-get autoremove -y \
    && apt-get clean

# Copy config
COPY ./../luya.sh /usr/local/bin/luya
COPY ./../custom.ini /usr/local/etc/php/conf.d/custom.ini

# Make the scripts executable
RUN chmod +x /usr/local/bin/luya

# Setup document root
RUN mkdir -p /app

# Make the document root a volume
VOLUME /app

ENTRYPOINT [ "/usr/local/bin/luya" ]