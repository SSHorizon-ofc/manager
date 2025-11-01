#!/bin/bash

curl -s -L -o /usr/local/bin/sshorizon https://install.sshorizon.shop/manager/$(uname -m)/install-sshorizon
chmod +x /usr/local/bin/sshorizon
sudo mkdir -p /opt/sshorizon/ssl

sudo openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /opt/sshorizon/ssl/privkey.pem \
  -out /opt/sshorizon/ssl/fullchain.pem \
  -subj "/C=BR/ST=SP/L=SaoPaulo/O=SSHorizon/OU=TI/CN=example.com"

if ! grep -q '^MaxStartups 1000:10:1000$' /etc/ssh/sshd_config; then
    echo 'MaxStartups 1000:10:1000' >> /etc/ssh/sshd_config
    service ssh restart
fi

sshorizon
