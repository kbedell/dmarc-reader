#!/bin/bash
set -xe

rm -rf ${APP_DIR}/vendor

if [ -z "${COMPOSER_FLAGS}" ]; then
    COMPOSER_FLAGS='--no-scripts --no-dev --prefer-dist'
fi

cd ${APP_DIR} && /usr/local/bin/composer \
   install \
   --no-interaction \
   --no-ansi \
   ${COMPOSER_FLAGS}
#  --no-progress \