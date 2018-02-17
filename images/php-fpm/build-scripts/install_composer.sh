#!/bin/sh
# originally from google cloud platform github

# A shell script for installing composer
set -xe

EXPECTED_SIGNATURE=$(curl -f https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid composer installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php \
    --quiet \
    --install-dir=/usr/local/bin \
    --filename=composer

rm composer-setup.php