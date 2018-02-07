FROM marklee77/supervisor:alpine
LABEL maintainer="Mark Stillwell <mark@stillwell.me>"

RUN apk add --update-cache --no-cache \
        bind \
        bind-tools \
        dnssec-root && \
    rm -rf \
        /var/cache/apk/*

COPY root/etc/bind/named.conf /etc/bind/
RUN chmod 0644 /etc/bind/named.conf

COPY root/etc/supervisor/conf.d/bind.conf /etc/supervisor/conf.d/
RUN chmod 0644 /etc/supervisor/conf.d/bind.conf

EXPOSE 53 53/udp
