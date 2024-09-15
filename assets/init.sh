#!/bin/bash
set -e

# Start openssh server
echo "Starting sshd"
service ssh start

# Get its pid
pid=$(cat /var/run/sshd.pid)
echo "sshd started with pid $pid"

# Wait for it to stop
echo "Waiting for sshd to stop"
while [ -e /proc/$pid ]; do
  sleep 1
done
