FROM rootnroll/demo-ubuntu:18.04
LABEL maintainer "Pavel Sviderski <me@psviderski.name>"

# From https://github.com/influxdata/influxdata-docker/blob/master/telegraf/1.10/Dockerfile
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends iputils-ping snmp procps lm-sensors && \
    rm -rf /var/lib/apt/lists/*

RUN set -ex && \
    for key in \
        05CE15085FC09D18E99EFB22684A14CF2582E0C5 ; \
    do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
        gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
    done

ENV TELEGRAF_VERSION 1.10.2
RUN wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}-1_amd64.deb.asc && \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}-1_amd64.deb && \
    gpg --batch --verify telegraf_${TELEGRAF_VERSION}-1_amd64.deb.asc telegraf_${TELEGRAF_VERSION}-1_amd64.deb && \
    dpkg -i telegraf_${TELEGRAF_VERSION}-1_amd64.deb && \
    rm -f telegraf_${TELEGRAF_VERSION}-1_amd64.deb* && \
    chown -R box:box /etc/telegraf

# From https://github.com/influxdata/influxdata-docker/blob/master/influxdb/1.7/Dockerfile
ENV INFLUXDB_VERSION 1.7.5
RUN wget --no-verbose https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERSION}_amd64.deb.asc && \
    wget --no-verbose https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
    gpg --batch --verify influxdb_${INFLUXDB_VERSION}_amd64.deb.asc influxdb_${INFLUXDB_VERSION}_amd64.deb && \
    dpkg -i influxdb_${INFLUXDB_VERSION}_amd64.deb && \
    rm -f influxdb_${INFLUXDB_VERSION}_amd64.deb*

# Update init scripts to not claim ulimit -n greater than 512 to be able to run services in rootnroll.
RUN sed -i -e 's/^OPEN_FILE_LIMIT=.*/OPEN_FILE_LIMIT=512/' /etc/init.d/telegraf \
    && sed -i -e 's/^OPEN_FILE_LIMIT=.*/OPEN_FILE_LIMIT=512/' /etc/init.d/influxdb

WORKDIR /home/box
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/fish", "-l"]
