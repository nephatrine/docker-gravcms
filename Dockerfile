FROM nephatrine/nginx-php:latest
LABEL maintainer="Daniel Wolf <nephatrine@gmail.com>"

RUN echo "====== INSTALL PACKAGES ======" \
 && apk add git \
 && rm -rf /var/cache/apk/*

COPY override /