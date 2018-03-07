FROM mvertes/alpine-mongo

ENV AUTH yes
ENV STORAGE_ENGINE wiredTiger
ENV JOURNALING yes

ADD /build-scripts /build-scripts

CMD ["/build-scipts/run.sh"]
