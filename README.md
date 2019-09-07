# kebechet-action

GitHub Action to trigger Kebechet Automation bot for the current repository

Kebechet
--------

    I'm Kebechet, goddess of freshness. I will keep your sources and dependencies fresh and up-to-date.

Kebechet is a SourceOps bot that automates updating dependencies of your project. Currently, it supports managing and updating Python projects based on [pipenv](https://docs.pipenv.org/) files (`Pipfile` and `Pipfile.lock`) or `requirements.txt`/`requirements.in` files (see [pip-tools](https://pypi.org/project/pip-tools/) - Kebechet is a replacement for it)


For more information about Kebchet see the [README](/kebechet/README.rst).

<br>

SETUP
=====

### 1) Create the SSH key (if applicable)

If you already have an SSH key associated with your GitHub account and you want to use it, you can skip this step.

See the "[Generating a new SSH key](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)" for more info.

### 2) Create the `KEBECHET_SSH_PRIVATE_KEY` secret

**IMPORTANT:** The secret has to be **base64** encoded!

Encode the SSH key you want to use as such:

```bash
# Assuming that you have the key stored in ~/.ssh/kebechet_rsa
cat ~/.ssh/kebechet_rsa | base64
```

And set the base64 encoded key to the `KEBECHET_SSH_PRIVATE_KEY` secret. See "[Creating and Using Secrets](https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables)" for more info.


> In the future, it Kebechet might generate the SSH key *for* you, but at the moment it is not the case.

### 3) Add the Kebechet Action to a workflow

Example:

```yaml
name: Kebechet

on: [issues, issue_comment]

jobs:
  build:

    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v1
    
    - name: Run Kebechet
      uses: cermakm/kebechet-action@master
      env:
        GITHUB_TOKEN: '${{ secrets.GITHUB_TOKEN }}'
      with:
        # Provide Kebechet the base64 encoded SSH key to use)
        # see https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent for more info)
        ssh_key: '${{ secrets.KEBECHET_SSH_PRIVATE_KEY }}'
```

OR

If you want to make Kebechet Action a step in your Main workflow, you can do it as such:

Example:

```yaml
steps:
# This step is important to run at any point of your workflow as well, it mounts the GitHub workspace that the Kebechet assumes is present
- uses: actions/checkout@v1
- name: Run Kebechet
    uses: cermakm/kebechet-action@master
    env:
      GITHUB_TOKEN: '${{ secrets.GITHUB_TOKEN }}'
    with:
      # Provide Kebechet the SSH key to use
      # see https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent for more info)
      ssh_key: '${{ secrets.KEBECHET_SSH_PRIVATE_KEY }}'
    # [optional] If you want to run Kebechet only on issues and issue comments, do it as such
    if: github.event_name == 'issues' || github.event_name == 'issue_comment'
```

<br>

USAGE
=====

For more information about Kebchet see the [README](/kebechet/README.rst) for more information and see the available [managers](/kebechet/kebechet/managers).

To make sure everything works properly, create an issue with the title `'Kebechet info'`.

<br>

Notes
=====

To issue an update to Git repository, Kebechet creates branches in the provided repository.