FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        git \
        wget \
        gpg \
        unzip \
    && rm -rf /var/lib/apt/lists/*

COPY --chmod=755 /requirements.txt .

RUN mkdir -p /opt/sam

RUN wget -i requirements.txt --no-check-certificate

RUN unzip aws-sam-cli-linux-x86_64.zip -d /opt/sam \
    && ./opt/sam/install

RUN unzip awscli-exe-linux-x86_64.zip \
    && ./aws/install

RUN rm -rf /requirements.txt aws-sam-cli-linux-x86_64.zip awscli-exe-linux-x86_64.zip

CMD ["tail","-f","/dev/null"]