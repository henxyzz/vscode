FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PASSWORD=vscode123

RUN apt update && apt install -y \
    curl \
    git \
    nodejs \
    npm \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://code-server.dev/install.sh | sh

EXPOSE 8080

CMD echo "===================================" && \
    echo " VS CODE SERVER RUNNING " && \
    echo " URL      : http://localhost:8080" && \
    echo " PASSWORD : $PASSWORD" && \
    echo "===================================" && \
    code-server \
      --bind-addr 0.0.0.0:8080 \
      --auth password \
      --password $PASSWORDp
