#!/bin/sh
# CALL this script with GRAFANA_PASS='pwd_here' ./grafana_start.sh
echo "Setup Grafana & InfluxDB"
if [ -z "${GRAFANA_PASS}" ]
then
  echo "You need to set GRAFANA_PASS environment variable to run this script"
  exit 1
fi
docker run --name grafana -d -p 80:3000 -v /var/lib/grafana:/var/lib/grafana -e "GF_SECURITY_ADMIN_PASSWORD=${GRAFANA_PASS}" grafana/grafana
docker run --name influxdb -d --volume=/var/influxdb:/var/influxdb -p 8083:8083 -p 8086:8086 tutum/influxdb
docker ps

# To configure influxdb
# docker exec -ti influxdb /usr/bin/influx
