#!/bin/sh
echo "
         ######################################
         ###          Release test           ##
         ######################################
"


# Make sure tests fails if a commend ends without 0
set -e

if [ "$ISSO_VERSION" = "" ]; then
    echo "\$ISSO_VERSION is not set. Useless test... Exiting."
    exit 0
fi

# Check for command existence
# See: https://www.shivering-isles.com/helpful-shell-snippets-for-docker-testing-and-bootstrapping/
command_exists() { command -v "$1" >/dev/null 2>&1 || { echo >&2 "I require $1 but it's not installed.  Aborting."; exit 1; }; }

# Version comparison equal
# See: https://www.shivering-isles.com/helpful-shell-snippets-for-docker-testing-and-bootstrapping/
version_eq() { test "$1" = "$2"; }  

VERSION=$(docker run --rm --entrypoint /bin/sh isso:testing -c "isso --version" | cut -d" " -f2)

if version_eq "$ISSO_VERSION" "$VERSION"; then
    echo "isso version ($ISSO_VERSION) is correct! Test successful."
else
    echo >&2 "Installed version doesn't match \$ISSO_VERSION. Installed version is $VERSION"
    exit 1
fi

