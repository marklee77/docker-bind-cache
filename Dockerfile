FROM marklee77/supervisor:alpine
LABEL maintainer="Mark Stillwell <mark@stillwell.me>"

RUN apk add --update-cache --no-cache \
        bind \
        bind-tools \
        dnssec-root && \
    rm -rf \
        /etc/bind/* \
        /var/bind/* \
        /var/cache/apk/*

COPY root/etc/bind/rndc.conf /etc/bind/
RUN chmod 0644 /etc/bind/rndc.conf

COPY root/etc/my_init.d/10-bind-setup /etc/my_init.d/
RUN chmod 0755 /etc/my_init.d/10-bind-setup

COPY root/etc/supervisor/conf.d/bind.conf /etc/supervisor/conf.d/
RUN chmod 0644 /etc/supervisor/conf.d/bind.conf

EXPOSE 53 53/udp
