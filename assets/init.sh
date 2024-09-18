#!/bin/bash
set -e

# Copy the files from /config if present
if [ -d /config ]; then
  echo "Copying /config to /root/.ssh"
  cp -vr /config/* /root/.ssh

  echo "Fixing .ssh permissions"
  chmod 700 /root/.ssh

  if [ -f /root/.ssh/authorized_keys ]; then
    echo "Fixing authorized_keys permissions"
    chmod 644 /root/.ssh/authorized_keys
  fi
  if [ -f /root/.ssh/id_rsa ]; then
    echo "Fixing id_rsa permissions"
    chmod 600 /root/.ssh/id_rsa
  fi
  if [ -f /root/.ssh/known_hosts ]; then
    echo "Fixing known_hosts permissions"
    chmod 644 /root/.ssh/known_hosts
  fi
fi

# Start openssh server
echo "Starting sshd"
service ssh start

# Get its pid
sleep 2s
pid=$(cat /var/run/sshd.pid)
echo "sshd started with pid $pid"

# Wait for it to stop
echo "Waiting for sshd to stop"
while [ -e /proc/$pid ]; do
  sleep 1
done
