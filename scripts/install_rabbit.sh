#!/usr/bin/env bash
# Downloads and installs the latest RabbitMQ server.

sh -c 'echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs) main" >> /etc/apt/sources.list'
sh -c 'echo "deb http://packages.erlang-solutions.com/ubuntu $(lsb_release -cs) contrib" >> /etc/apt/sources.list'
echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list

echo "==> Added deb sources"
cat /etc/apt/sources.list

wget --quiet -O - http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | apt-key add -
wget --quiet -O - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -

apt-get update

echo "==> Updated indexes"

apt-get install -y unixodbc
apt-get install -y erlang-nox
apt-get install -y rabbitmq-server

echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config

# RabbitMQ Plugins
service rabbitmq-server stop
rabbitmq-plugins enable rabbitmq_management
rabbitmq-plugins enable rabbitmq_jsonrpc
service rabbitmq-server start

rabbitmq-plugins list

exit 0
