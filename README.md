# Python semantic release GitHub action

This action uses the [python-semantic-release](https://github.com/relekang/python-semantic-release) tool to automatically deduce the semantic version and also to build and push the python package to PyPI and github releases.

This action is almost the same as the [official](https://github.com/relekang/python-semantic-release) action but uses the latest stable release of the python-semantic-release package instead of checking out master.


## Usage
The usage is the same as the offical action. 

Example:
```
name: Python Semantic Release

on:
  push:
    branches:
      - master

jobs:
  release:
    runs-on: ubuntu-latest
    concurrency: release

    steps:
    - uses: actions/checkout@v2
      with:
        fetch-depth: 0

    - name: Python Semantic Release
      uses: aadhithya/py-semantic-release-action@master
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        repository_username: __token__
        repository_password: ${{ secrets.PYPI_TOKEN }}
```

### Inputs
- `directory`: Sub-directory to cd into before running semantic-release.
- `github_token`: [REQUIRED]: GitHub token used to push release notes and new commits/tags.
- `pypi_token`: PyPI API token to push build to pypi.
- `repository_username`: Username with project access to push to Artifact Repository.
- `repository_password`: Password or token to the account specified in repository_username.


## Acknowledgements
- This action draws most of its code from the [python-semantic-release](https://github.com/relekang/python-semantic-release) repository.
