FROM ubuntu:xenial

ARG RUST_CHANNEL=nightly
ARG RUSTFMT_REV="--branch master"
ARG CLIPPY_REV="--branch master"
ARG BIN_PATH=/usr/local/bin
ARG CARGO_ROOT_BIN_PATH=/root/.cargo/bin

RUN set -x \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    libcurl3 \
    git \
    file \
    libssl-dev \
    pkg-config \
    && curl https://static.rust-lang.org/rustup.sh | sh -s -- \
    --yes \
    --disable-sudo \
    --channel=${RUST_CHANNEL} \
    && cargo install cargo-fmt git-rustfmt rustfmt-bin rustfmt-format-diff -f --git https://github.com/rust-lang-nursery/rustfmt.git ${RUSTFMT_REV} \
    && cargo install clippy --git https://github.com/rust-lang-nursery/rust-clippy.git ${CLIPPY_REV} \
    && mv ${CARGO_ROOT_BIN_PATH}/* ${BIN_PATH} \
    && apt-get remove -y --auto-remove curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm -rf /root/.cargo/git

WORKDIR /volume