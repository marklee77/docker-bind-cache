FROM marklee77/supervisor:alpine
MAINTAINER Mark Stillwell <mark@stillwell.me>

RUN apk add --update-cache --no-cache \
        bind \
        bind-tools \
        dnssec-root && \
    rm -rf \
        /etc/bind/* \
        /var/bind/* \
        /var/cache/apk/*

COPY root/etc/supervisor/conf.d/bind.conf /etc/supervisor/conf.d/
RUN chmod 0644 /etc/supervisor/conf.d/bind.conf

COPY root/etc/bind/named.conf /etc/bind/named.conf
RUN chmod 0644 /etc/bind/named.conf

EXPOSE 53 53/udp
