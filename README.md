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
