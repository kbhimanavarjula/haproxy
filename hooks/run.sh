#!/bin/sh
export HOME=/hab/svc/haproxy/data
cd /hab/svc/haproxy

if [ "$(whoami)" = "root" ]; then
  exec chpst \
    -U hab:hab \
    -u hab:hab \
    haproxy -f config/haproxy.conf -db 2>&1
else
  exec haproxy -f config/haproxy.conf -db 2>&1
fi
