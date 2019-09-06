#!/bin/sh -l

# The git_ssh_command helps the server by pass the Host key checking while connecting to github.
export GIT_SSH_COMMAND='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# Set the SSH secret
mkdir -p $HOME/.ssh/
echo "${KEBECHET_SSH_PRIVATE_KEY}" | base64 --decode > $HOME/.ssh/id_rsa && chmod 400 $HOME/.ssh/id_rsa

# Test permissions
ssh -vT git@github.com

# Run Kebechet
echo "\nRunning Kebechet ...\n"
kebechet run "${GITHUB_WORKSPACE}/$@"
