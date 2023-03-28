# link-github-backlog-action

## How to use

You can use this action like this.

```
name: Pull Request Opened Workflow (test)

on:
  pull_request:
    types: [opened]

env:
  GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  GH_REPO: ${{ github.repository }}

jobs:
  handle_opened_pull_request:
    runs-on: ubuntu-latest
    steps:
    - name: Set Backlog issue URL.
      uses: RikiyaOta/link-github-backlog-action@main
      with:
        backlog-project-key: ${{ secrets.BACKLOG_PROJECT_KEY }}
        backlog-fqdn: ${{ secrets.BACKLOG_FQDN }}
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
