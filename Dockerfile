# Container image that runs your code
FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends awscli && \
    pip3 install tensorkube && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
