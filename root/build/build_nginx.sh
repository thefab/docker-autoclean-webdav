#!/bin/bash

VERSION=1.8.1
URL=http://nginx.org/download/nginx-${VERSION}.tar.gz

cd /build
wget -O nginx-${VERSION}.tar.gz ${URL}
zcat nginx-${VERSION}.tar.gz |tar xvf -
cd nginx-${VERSION} ||exit 1

./configure --prefix=/opt/nginx --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module --without-http_uwsgi_module --without-http_fastcgi_module --without-http_scgi_module --without-http_memcached_module --without-http_empty_gif_module --with-threads --with-file-aio --with-http_realip_module --with-http_dav_module --with-http_stub_status_module
make
make install
mv /opt/nginx/conf /opt/nginx/conf.orig
mkdir /opt/nginx/conf
