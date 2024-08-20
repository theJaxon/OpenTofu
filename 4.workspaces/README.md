### 4.workspaces
- Allows using same code but parametarized by different variable definition files to deploy to multiple enviornments.
- Workspace are the equivalent of renaming state files (`dev.tfstate` or `test.tfstate`) and executing `tofu apply -state=<path>`

```bash
tofu workspace list
```