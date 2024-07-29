# OpenTofu
OpenTofu is a fork of Hashicorp's terraform (Due to license changes)

---

### Install OpenTofu
```bash
# Download the installer script:
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh

# Give it execution permissions
chmod +x install-opentofu.sh

# Run the installer:
./install-opentofu.sh --install-method rpm

# Remove the installer:
rm install-opentofu.sh

# Alias terraform to tofu
vi ~/.bashrc
alias terraform=tofu
```

---

### Docker
```bash
# https://docs.rockylinux.org/gemstones/containers/docker/
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl --now enable docker
sudo usermod -a -G docker $(whoami)
```

### LocalStack
```bash
# Download CLI
python3 -m pip install localstack

GATEWAY_LISTEN="0.0.0.0" localstack start -d

curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

curl http://localhost:4566/_localstack/health | jq
```
