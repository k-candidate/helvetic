FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive

RUN groupadd -g 65532 nonroot && \
    useradd -u 65532 -g 65532 -s /bin/bash -m nonroot && \
    apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    curl \
    dnsutils \
    file \
    iproute2 \
    iputils-ping \
    jq \
    less \
    lsof \
    net-tools \
    netcat-openbsd \
    openssl \
    procps \
    socat \
    strace \
    sudo \
    tcpdump \
    traceroute \
    vim \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "nonroot ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nonroot && \
    chmod 0440 /etc/sudoers.d/nonroot

RUN echo "alias ll='ls -alF'" >> /etc/bash.bashrc

USER nonroot
WORKDIR /home/nonroot

CMD ["/bin/bash"]
