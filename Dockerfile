FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    sed \
    make \
    binutils \
    build-essential \
    gcc \
    g++ \
    bash \
    patch \
    gzip \
    bzip2 \
    perl \
    tar \
    cpio \
    python \
    unzip \
    rsync \
    file \
    bc \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /buildroot

# Clone buildroot-at91 repository with retries
RUN for i in {1..5}; do \
        git clone https://github.com/linux4sam/buildroot-at91.git . && break || sleep 15; \
    done

ENV PATH="/buildroot/output/host/bin:${PATH}"

CMD ["/bin/bash"]