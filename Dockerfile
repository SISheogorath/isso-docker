FROM python:3.7-alpine

RUN apk add --no-cache --virtual .build-utils gcc musl-dev && \
    pip install isso && mkdir /data && \
    apk del .build-utils

COPY entrypoint.sh /entrypoint.sh

HEALTHCHECK CMD ["wget", "-qO", "/dev/null", "http://127.0.0.1/js/embed.min.js"]

ENTRYPOINT ["/entrypoint.sh"]
