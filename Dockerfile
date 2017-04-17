FROM python:3.6

RUN pip install isso && mkdir /data

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
