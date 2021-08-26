FROM alpine:3.14

RUN wget 'http://openresty.org/package/admin@openresty.com-5ea678a6.rsa.pub'; \
    mv 'admin@openresty.com-5ea678a6.rsa.pub' /etc/apk/keys/; \
    . /etc/os-release; \
    MAJOR_VER=`echo $VERSION_ID | sed 's/\.[0-9]\+$//'`; \
    echo "http://openresty.org/package/alpine/v$MAJOR_VER/main" \
    | tee -a /etc/apk/repositories ; \
    apk update; \
    apk add openresty openrc --no-cache; \
    adduser -D -g 'www' www; \
    mkdir -p /var/www/default; \
    chown -R www:www /var/www/default/; \
    mkdir -p /var/log/openresty; \
    rm /usr/local/openresty/nginx/conf/nginx.conf

COPY nginx.conf /usr/local/openresty/nginx/conf/

EXPOSE 80
ENTRYPOINT ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
