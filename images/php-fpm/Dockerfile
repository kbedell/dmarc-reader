FROM php:7.1-fpm-alpine

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache \
        bash \
        $PHPIZE_DEPS \
        icu \
        libintl \
        libmcrypt-dev \
        zlib-dev \
    && pecl channel-update pecl.php.net \
    && pecl install -f mcrypt redis \
    && pecl install -f mongodb \
    && echo "extension=mcrypt.so" > /usr/local/etc/php/conf.d/mcrypt.ini \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini

ENV APP_DIR /var/www/html

ADD build-scripts /build-scripts

RUN find /build-scripts -type f -exec chmod +x {} \; \
    && /build-scripts/install_composer.sh

# Allow customizing some composer flags
ONBUILD ARG COMPOSER_FLAGS='--no-scripts --no-dev --prefer-dist'
ONBUILD ENV COMPOSER_FLAGS=${COMPOSER_FLAGS}

# Copy the application and change owner
ONBUILD WORKDIR ${APP_DIR}
ONBUILD COPY . ${APP_DIR}
ONBUILD RUN /build-scripts/composer.sh
ONBUILD RUN chown -R www-data:www-data ${APP_DIR}

CMD ["php-fpm"]