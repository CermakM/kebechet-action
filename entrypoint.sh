#!/bin/bash -l

set -e

export KEBECHET_REPO_URL="https://github.com/${GITHUB_REPOSITORY}"
export KEBECHET_TOKEN="${GITHUB_TOKEN}"
export SSH_HOME_DIRECTORY=/root

decode() {
    local decoded="$(echo \"$1\" | base64 -i -w 0 --decode)"
    if [ $? -ne 0 ] ; then
        exit 1;
    fi
    >&1 echo "$decoded"
}

prep() {
    # Set the SSH secret
    mkdir -p ${SSH_HOME_DIRECTORY}/.ssh/
    decode "${KEBECHET_SSH_PRIVATE_KEY}" > ${SSH_HOME_DIRECTORY}/.ssh/id_rsa && chmod 0400 ${SSH_HOME_DIRECTORY}/.ssh/id_rsa

    # Test permissions
    # Ignore exit code as exit status 1 is returned when no terminal is present, serves for debugging purposes
    >&2 ssh -o "StrictHostKeyChecking=no" -vT git@github.com || true
}

main() {
    prep || exit 1

    # Run Kebechet
    echo "\nRunning Kebechet ...\n"
    GIT_SSH_COMMAND='ssh -o StrictHostKeyChecking=no' kebechet run "${GITHUB_WORKSPACE}/$@"
}

main "$@"
