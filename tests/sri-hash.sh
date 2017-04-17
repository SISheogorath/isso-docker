#!/bin/sh
echo "
         ######################################
         ###            SRI test             ##
         ######################################
"


# Make sure tests fails if a commend ends without 0
set -e

# Generate some random ports for testing
PORT=$(cat /dev/urandom|od -N2 -An -i|awk -v f=10000 -v r=19999 '{printf "%i\n", f + r * $1 / 65536}')


# Make sure the ports are not already in use. In case they are rerun the script to get new ports.
[ $(netstat -an | grep LISTEN | grep :${PORT} | wc -l) -eq 0 ] || { ./$0 && exit 0 || exit 1; }

# Run container in a simple way
DOCKERCONTAINER=$(docker run -d -p 127.0.0.1:${PORT}:80 isso:testing run)
sleep 5

# Check Generate SRI hash for '/js/embed.min.js'
HASH256="$(wget -qO- http://127.0.0.1:${PORT}/js/embed.min.js | openssl dgst -sha256 -binary | openssl base64 -A)"
HASH384="$(wget -qO- http://127.0.0.1:${PORT}/js/embed.min.js | openssl dgst -sha384 -binary | openssl base64 -A)"
HASH512="$(wget -qO- http://127.0.0.1:${PORT}/js/embed.min.js | openssl dgst -sha512 -binary | openssl base64 -A)"

echo "SRI hash for SHA256 is: $HASH256"
echo "SRI hash for SHA384 is: $HASH384"
echo "SRI hash for SHA512 is: $HASH512"

test "$HASH256" = "${SRI_SHA256}"
test "$HASH384" = "${SRI_SHA384}"
test "$HASH512" = "${SRI_SHA512}"

# Clean up
docker stop ${DOCKERCONTAINER} && docker rm ${DOCKERCONTAINER}

