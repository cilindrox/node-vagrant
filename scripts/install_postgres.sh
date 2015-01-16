#!/usr/bin/env bash
# Installs PostgreSQL 9.4 -- Taken from https://wiki.postgresql.org/wiki/Apt

sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

apt-get install -y wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get update
apt-get upgrade -y

apt-get install -y postgresql-9.4 postgresql-contrib-9.4 pgadmin3

su -c 'createuser -s vagrant' postgres
sed -ibk \
  -re "s/[#]*listen_addresses = '.*'(.*)/listen_addresses = '*'\1/" \
  /etc/postgresql/9.4/main/postgresql.conf
echo "host    all   vagrant   10.0.2.2/32  trust" | tee -a /etc/postgresql/9.4/main/pg_hba.conf
service postgresql restart
su -c 'createdb vagrant' vagrant

su vagrant -c 'touch /home/vagrant/.psql_history'

exit 0
