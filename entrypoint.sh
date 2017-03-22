#!/bin/sh

cat >/isso.conf <<EOF
[general]
dbpath = /data/isso.db
name = ${ISSO_NAME:-comments.example.com}
host = ${ISSO_HOST:-http://example.com}
max-age = ${ISSO_MAX_AGE:-30m}

[server]
listen = http://0.0.0.0:80

[guard]
enabled = true
ratelimit = 2
direct-reply = 3
reply-to-self = ${ISSO_REPLY_TO_SELF:-false}
require-email = ${ISSO_REQUIRE_EMAIL:-false}
require-author = ${ISSO_REQUIRE_AUTHOR:-false}

EOF

exec isso -c /isso.conf "$@"
