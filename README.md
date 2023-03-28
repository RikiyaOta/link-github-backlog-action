# link-github-backlog-action

## How to use


### 1. Set your Backlog data.

You must set 2 secrets:

- BACKLOG_PROJECT_KEY
- BACKLOG_FQDN

If you don't know how to create your secrets, see [this](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-an-environment).

### 2. Set your workflow permissions.

This action writes a url to your pull request body, so your workflow must have write access permission.

There are 2 ways:


1. Change your workflow's default permissions. [See](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#setting-the-permissions-of-the-github_token-for-your-repository).
2. Specify your workflow permission in the workflow file. [See](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#modifying-the-permissions-for-the-github_token).


### 3. Use this action in your workflow.

You can use this action like this.

```
name: Your workflow name

on:
  pull_request:
    types: [opened]

jobs:
  your_job_name:
    runs-on: ubuntu-latest
    steps:
    - name: Set Backlog issue URL.
      uses: RikiyaOta/link-github-backlog-action@v1
      # Required.
      with:
        backlog-project-key: ${{ secrets.BACKLOG_PROJECT_KEY }}
        backlog-fqdn: ${{ secrets.BACKLOG_FQDN }}
      # Required.
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        GH_REPO: ${{ github.repository }}
```

## Development

- Install [act](https://github.com/nektos/act).
- Create your local files like this:

```
$ cd local/
$ cp github-action.env.sample github-action.env
$ cp github-action.secrets.sample github-action.secrets
$ cp pull-request.json.sample pull-request.json
```

- Run on local:

```
$ act pull_request --container-architecture linux/amd64 \
    --eventpath local/pull-request.json \
    --env-file local/github-action.env \
    --secret-file local/github-action.secrets
```
