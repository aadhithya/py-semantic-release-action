#!/bin/bash

set -e

# Copy inputs into correctly-named environment variables
export GH_TOKEN="${INPUT_GITHUB_TOKEN}"
export PYPI_TOKEN="${INPUT_PYPI_TOKEN}"
export REPOSITORY_USERNAME="${INPUT_REPOSITORY_USERNAME}"
export REPOSITORY_PASSWORD="${INPUT_REPOSITORY_PASSWORD}"

# Change to configured directory
cd "${INPUT_DIRECTORY}"

# Set Git details
git config --global user.name "semantic-release-action"
git config --global user.email "action@github.com"

# Run Semantic Release
semantic-release publish -v DEBUG \
    -D commit_author="semantic-release-action <action@github.com>"