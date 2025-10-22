FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive

RUN groupadd -g 65532 nonroot && \
    useradd -u 65532 -g 65532 -s /bin/bash -m nonroot && \
    apt-get update && apt-get install -y --no-install-recommends \
    bash \
    curl \
    wget \
    less \
    procps \
    iproute2 \
    iputils-ping \
    netcat-openbsd \
    dnsutils \
    traceroute \
    tcpdump \
    lsof \
    strace \
    net-tools \
    jq \
    socat \
    openssl \
    ca-certificates \
    sudo \
    vim \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "nonroot ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nonroot && \
    chmod 0440 /etc/sudoers.d/nonroot

RUN echo "alias ll='ls -alF'" >> /etc/bash.bashrc

USER nonroot
WORKDIR /home/nonroot

CMD ["/bin/bash"]
