curl -s -L -o /usr/local/bin/sshorizon https://github.com/SSHorizon-ofc/manager/raw/refs/heads/main/$(uname -m)/sshorizon
chmod +x /usr/local/bin/sshorizon
mkdir /opt/sshorizon/ssl
sshorizon
