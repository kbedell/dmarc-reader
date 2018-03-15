FROM alpine:edge

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache \
        bash \
        mongodb \
    && rm /usr/bin/mongoperf \
    && rm -rf /var/cache/aspk/*

ENV AUTH yes
ENV STORAGE_ENGINE wiredTiger
ENV JOURNALING yes

ADD build-scripts /build-scripts

RUN find /build-scripts -type f -exec chmod +x {} \;
 
CMD ["/build-scripts/run.sh"]
