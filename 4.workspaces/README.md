### 4.workspaces
- Allows using same code but parametarized by different variable definition files to deploy to multiple enviornments.
- Workspace are the equivalent of renaming state files (`dev.tfstate` or `test.tfstate`) and executing `tofu apply -state=<path>`

```bash
tofu workspace list

# Create and switch to new workspace
tofu workspace new dev
tofu workspace new test

tofu workspace select dev
tofu apply -auto-approve -var-file environments/dev/terraform.tfvars
tofu destroy -auto-approve -var-file environments/dev/terraform.tfvars

tofu workspace select test
tofu apply -auto-approve -var-file environments/test/terraform.tfvars
tofu destroy -auto-approve -var-file environments/test/terraform.tfvars
```