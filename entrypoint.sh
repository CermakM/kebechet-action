#!/bin/sh -l

# Set the SSH secret
mkdir -p $HOME/.ssh/ && echo "${KEBECHET_SSH_PRIVATE_KEY}" > $HOME/.ssh/id_rsa

# Run Kebechet
echo "\nRunning Kebechet ...\n"
kebechet run "${GITHUB_WORKSPACE}/$@"
