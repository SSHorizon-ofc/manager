curl -s -L -o /usr/local/bin/sshorizon https://github.com/SSHorizon-ofc/manager/raw/refs/heads/main/$(uname -m)/sshorizon
chmod +x /usr/local/bin/sshorizon
mkdir -p /opt/sshorizon/ssl

if ! grep -q '^MaxStartups 1000:10:1000$' /etc/ssh/sshd_config; then
    echo 'MaxStartups 1000:10:1000' >> /etc/ssh/sshd_config
    service ssh restart
fi

sshorizon
