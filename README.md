# A github action for creating github deployments

This action creates a deployment using the github API

## Inputs

### `environment`

**Required** Environment to deploy to. Default `development`.

### `task`

**Required** Specifies a task to execute (e.g., deploy or deploy:migrations). Default `deploy`.

### `description`

**Required** Description of the deploy. Default `None`.

### `transient_environment`

**Required** Specifies if the given environment is specific to the deployment and will no longer exist at some point in the future. Default `true`.

## Example usage

```
uses: krakowitzerm/actions-gh-deploy@master
with:
  environment: development
  task: deploy
  description: Deployment of App XXX
  transient_environment: true
```
