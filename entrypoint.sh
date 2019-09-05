#!/bin/sh -l

echo -e "Running Kebechet ...\n"
kebechet run "$GITHUB_WORKSPACE/$@"
