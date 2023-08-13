# Container image that runs your code
FROM ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends \
  && apt-get install -y wget \
  && apt-get install -y uzip

RUN wget https://github.com/codemakerai/codemaker-cli/releases/download/v0.0.12/linux-amd64.zip -P /usr/local/bin/codemaker-cli \
  && uzip /usr/local/bin/codemaker-cli/linux-amd64.zip \
  && export PATH=$PATH:/usr/local/bin/codemaker-cli/linux-amd64/bin

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
