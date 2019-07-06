FROM ubuntu:bionic
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG RUST_CHANNEL=stable

# https://github.com/rust-lang/rustup.rs/issues/1085#issuecomment-296604244
# The cargo build cache goes into CARGO_HOME, and for it to be usable for any
# user, it has to be set at per user basis during Docker container runtime
ARG CARGO_HOME=/opt/.cargo
ENV RUSTUP_HOME=/opt/.rustup
ENV PATH=${CARGO_HOME}/bin:${PATH}

RUN set -eu && \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
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
        ; \
    curl https://sh.rustup.rs -sSf | \
        sh -s -- -y --no-modify-path --default-toolchain ${RUST_CHANNEL}; \
    rustup component add rustfmt clippy; \
    rustc --version; \
    cargo --version; \
    apt-get remove -y --auto-remove curl; \
    apt-get clean; \
    rm ${CARGO_HOME}/bin/rustup; \
    rm -rf ${CARGO_HOME}/registry/*; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
    :

# Place the runtime CARGO_HOME at supposed mounted directory so that it is
# usable for all users and the cache is retained
ENV CARGO_HOME=/volume/.cargo
WORKDIR /volume
