FROM ubuntu:xenial

ARG RUST_CHANNEL=nightly
ARG RUSTFMT_REV="-b master"
ARG CLIPPY_REV="-b master"
ARG BIN_PATH=/usr/local/bin
ARG CARGO_ROOT_BIN_PATH=/root/.cargo/bin

RUN set -x \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    file \
    libssl-dev \
    curl \
    libcurl3 \
    libpq-dev \
    pkg-config \
    libsqlite3-dev \
    zlib1g-dev \
    && curl https://static.rust-lang.org/rustup.sh | sh -s -- \
    --yes \
    --disable-sudo \
    --channel=${RUST_CHANNEL} \
    && rustc --version \
    && cargo --version \
    && git clone https://github.com/rust-lang-nursery/rustfmt.git ${RUSTFMT_REV} \
    && cd rustfmt \
    && git rev-parse HEAD \
    && cargo install -f --path . \
    && cd .. \
    && rm -rf rustfmt \
    && git clone https://github.com/rust-lang-nursery/rust-clippy.git ${CLIPPY_REV} \
    && cd rust-clippy \
    && git rev-parse HEAD \
    && cargo install --path . \
    && cd .. \
    && rm -rf rust-clippy \ 
    && mv ${CARGO_ROOT_BIN_PATH}/* ${BIN_PATH} \
    && apt-get remove -y --auto-remove curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm -rf /root/.cargo

WORKDIR /volume
