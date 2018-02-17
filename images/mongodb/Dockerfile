FROM mvertes/alpine-mongo

ENV AUTH yes
ENV STORAGE_ENGINE wiredTiger
ENV JOURNALING yes

ADD /build-scripts /build-scripts

RUN find /build-scripts -type f -exec chmod +x {} \;

CMD ["/build-scipts/run.sh"]
