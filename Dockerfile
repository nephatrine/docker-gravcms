FROM nephatrine/nginx-php:7
LABEL maintainer="Daniel Wolf <nephatrine@gmail.com>"

RUN echo "====== INSTALL PACKAGES ======" \
 && apk add git \
 && rm -rf /var/cache/apk/*

COPY override /