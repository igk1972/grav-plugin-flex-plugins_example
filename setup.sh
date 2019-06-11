#!/bin/sh

set -e

[ -z "$1" ] || GRAV_VERSION="$1"

[ -z "$GRAV_VERSION" ] && GRAV_VERSION="1.6.9"

echo "Setup Grav $GRAV_VERSION"

wget -q -O - https://github.com/getgrav/grav/archive/$GRAV_VERSION.tar.gz | tar -xzf - --strip-components=1 -C public

cd public

composer install

bin/gpm install -y quark admin

git clone https://github.com/igk1972/grav-plugin-flex-directory user/plugins/flex-directory

exit $?
