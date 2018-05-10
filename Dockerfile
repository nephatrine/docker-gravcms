FROM nephatrine/nginx-lemp:latest
LABEL maintainer="Daniel Wolf <nephatrine@gmail.com>"

RUN echo "====== NOT MUCH TO DO ======" \
 && apk --update upgrade \
 && rm -rf \
  /tmp/* \
  /usr/src/* \
  /var/cache/apk/*

COPY override /