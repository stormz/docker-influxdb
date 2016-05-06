from buildpack-deps:jessie-curl

ENV VERSION 0.12.2-1

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb_${VERSION}_amd64.deb \
    && dpkg -i influxdb_${VERSION}_amd64.deb \
    && rm influxdb_${VERSION}_amd64.deb

# Admin server WebUI
EXPOSE 8083
# HTTP API
EXPOSE 8086 

CMD ["influxd"]
