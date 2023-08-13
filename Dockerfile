# Container image that runs your code
FROM ubuntu

# Install helper packages
RUN apt-get update \
  && apt-get -y autoremove \
  && apt-get clean \
  && apt-get install -y -qq wget zip unzip \
  && rm -rf /var/lib/apt/lists/*

# Download codemaker cli
RUN wget https://github.com/codemakerai/codemaker-cli/releases/download/v0.0.12/linux-amd64.zip -P /usr/local/bin/codemaker-cli \
  && unzip /usr/local/bin/codemaker-cli/linux-amd64.zip

# Add codemaker cli tp PATH
ENV PATH="$PATH:/usr/local/bin/codemaker-cli/linux-amd64/bin"

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
