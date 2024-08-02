# OpenTofu
OpenTofu is a fork of Hashicorp's terraform (Due to license changes)

- It's a state management solution that performs CRUD operations on managed resources.

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

---

### Building blocks

#### [Providers](https://developer.hashicorp.com/terraform/language/providers)
- Plugins mainly used for interacting with cloud providers (But not necessarily)
- An example can be [`AWS provider`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) but also can be [`local provider`](https://registry.terraform.io/providers/hashicorp/local/latest/docs)
- Each time you add a new provider, you should use `terraform init`.

#### [Data sources](https://developer.hashicorp.com/terraform/language/data-sources)
- Use information defined outside of terraform

#### [Modules](https://developer.hashicorp.com/terraform/language/modules)
- Allows encapsulating a group of resources that perform one task into a collection of standard configuration files within a dedicated directory.
- Enables code reuse
- They can be local or remote (HTTP URL or module registry)

---

### Best practices
#### Put static files in a separate directory
- Create `files` directory for static files that will be referenced (ex: startup scripts).
- Separate `HereDoc` from HCL code and use **file()** function to reference them.
- `.tftpl` extension should be used by files by files consumed via **templatefile()** function.
- templates should be placed under `templates` directory. 

#### Protect stateful resources
- Lifecycle Meta-argument [`prevent_destroy`](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle#prevent_destroy) can be used to prevent stateful resource deletion.

#### Use count for conditional variables
```hcl
variable "my_var" {
  description = ""
  type = list
  default = []
}

resource "resource_type" "reference_name" {
  // Do not create this resource if the list is empty
  // Resource gets created only if length is anything other than 0.
  count = length(var.readers) == 0 ? 0 : 1
}
```

---

### CLI
- `terraform plan` used for linting and shows what TF intends to do
  1. It reads the configuration and the state file
  2. Determine the needed CRUD actions to take
  3. Output the execution plan (Can be saved in JSON format ex `terraform plan -out plan.out && terraform show -json plan.out > plan.json`)
  * You can apply the binary file as well via `terraform apply plan.out`
```bash
# Linting + shows what TF intends to do
terraform plan
```

- `terraform refresh` is used for updating the state file (Used for detecting drifts).

---

### References
1. Architecting AWS with Terraform: Design resilient and secure Cloud Infrastructures with Terraform on Amazon Web Services