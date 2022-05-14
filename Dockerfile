# This Dockerfile is only for GitHub Actions
FROM python:3.9-slim

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    git-lfs

RUN pip install python-semantic-release

COPY . py-sem-release/

RUN semantic-release --help

ENTRYPOINT ["/py-sem-release/entrypoint.sh"]