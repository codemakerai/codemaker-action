# Container image that runs your code
FROM ubuntu

RUN apt-get update \
  && apt-get -y autoremove \
  && apt-get clean \
  && apt-get install -y wget zip unzip \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/codemakerai/codemaker-cli/releases/download/v0.0.12/linux-amd64.zip -P /usr/local/bin/codemaker-cli \
  && unzip /usr/local/bin/codemaker-cli/linux-amd64.zip \
  && export PATH=$PATH:/usr/local/bin/codemaker-cli/linux-amd64/bin

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
