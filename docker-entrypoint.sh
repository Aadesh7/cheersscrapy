#!/bin/bash

set -e

# Start Splash with the necessary configurations
/usr/local/bin/splash \
    --disable-browser-sandbox \
    --proxy-profiles-path=/etc/splash/proxy-profiles \
    --lua-package-path=/etc/splash/lua_modules/?.lua \
    --js-profiles-path=/etc/splash/js_profiles \
    --filters-path=/etc/splash/filters \
    "$@"