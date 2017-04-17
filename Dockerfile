FROM python:3.3

RUN pip install isso && mkdir /data

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
