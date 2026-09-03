#!/bin/sh

set -e

: "${SOCKS_USER:?SOCKS_USER is required}"
: "${SOCKS_PASSWORD:?SOCKS_PASSWORD is required}"

adduser -D "$SOCKS_USER"

echo "$SOCKS_USER:$SOCKS_PASSWORD" | chpasswd

exec sockd -f /etc/sockd.conf
