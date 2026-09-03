#!/bin/sh

set -eu

USER_NAME="${SOCKS_USER:-amir}"
USER_PASSWORD="${SOCKS_PASSWORD:-change-me}"

if ! id "$USER_NAME" >/dev/null 2>&1; then
    adduser -D -H -s /sbin/nologin "$USER_NAME"
fi

echo "$USER_NAME:$USER_PASSWORD" | chpasswd

echo "=== Network interfaces ==="
ip addr || true

echo "=== Starting Dante ==="

exec sockd -f /etc/sockd.conf
