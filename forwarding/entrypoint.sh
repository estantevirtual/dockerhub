#!/usr/bin/env bash

echo "* Running Forwarding entrypoint"

echo "* FWD_USER: $FWD_USER"

echo "* FWD_SERVER: $FWD_SERVER"

echo "$FWD_RSA" >> /.rsa

chmod 600 /.rsa

touch ~/.ssh/config
echo "Host *" >> config
echo "  ServerAliveInterval 60" >> config

IFS=',' read -ra strarr <<< $FWD_LIST

for FWD_CFG in "${strarr[@]}"; do
  echo "* Starting tunnel for $FWD_CFG"
  ssh -4 -i /.rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -fNT -L "0.0.0.0:$FWD_CFG" "$FWD_USER@$FWD_SERVER"
done

echo "* Let it go"

tail -f /dev/null
