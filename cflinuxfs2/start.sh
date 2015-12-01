#!/bin/sh
set -e

echo "Launching ssh at: `date`"
exec /usr/sbin/sshd -D -e -o LogLevel=INFO
