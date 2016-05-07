# Influxdb on Docker

An [InfluxDB][influxdb] docker image built on debian jessie.

This image should be production ready. Authentication and SSL is enabled.

## Prepare your ssl certificate

SSL is enabled by default. So you must provide a full chained certificate. Append your private key, the intermediate certificate and your server certificate.

## Usage

    docker run -d --restart=always -p 8083:8083 -p 8086:8086 -v YOURCERTPATH:/etc/ssl/influxdb.pem stormz/influxdb

## Setup auth

Auth is enabled by default. After starting the container, you must connect to it and create the super user.

    docker exec YOURCONTAINERID influx -ssl -unsafeSsl -execute "CREATE USER <user> WITH PASSWORD '<password>' WITH ALL PRIVILEGES"

Then you can setup others users with less privileges. See the InfluxDB documentation on [authentication and authorization](https://docs.influxdata.com/influxdb/v0.12/administration/authentication_and_authorization/).

[influxdb]: https://influxdata.com/time-series-platform/influxdb/
