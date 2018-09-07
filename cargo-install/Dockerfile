FROM ubuntu:bionic

ARG RUST_CHANNEL=nightly
ENV CARGO_HOME=/opt/.cargo
ENV RUSTUP_HOME=/opt/.rustup
ENV PATH=${CARGO_HOME}/bin:${PATH}

RUN set -ux \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    file \
    libssl-dev \
    curl \
    libcurl4 \
    libpq-dev \
    libmysqlclient-dev \
    pkg-config \
    libsqlite3-dev \
    zlib1g-dev \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path \
    --default-toolchain ${RUST_CHANNEL} \
    && rustup component add rustfmt-preview clippy-preview \
    && rustc --version \
    && cargo --version \
    && apt-get remove -y --auto-remove curl \
    && apt-get clean \
    && rm ${CARGO_HOME}/bin/rustup \
    && rm -rf ${CARGO_HOME}/registry/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /volume
