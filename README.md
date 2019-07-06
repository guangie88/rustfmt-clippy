# rustfmt-clippy

[![Build Status](https://travis-ci.org/guangie88/rustfmt-clippy.svg?branch=master)](https://travis-ci.org/guangie88/rustfmt-clippy)
[![Docker Image Layers](https://images.microbadger.com/badges/image/guangie88/rustfmt-clippy.svg)](https://microbadger.com/images/guangie88/rustfmt-clippy)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Builds a Rust environment Docker image to get an easy-to-use working code
formatting and linting set-up for CI/CD, executable for any user.

Periodically run by CI to automatically push valid Docker images into the
[Docker registry](https://hub.docker.com/r/guangie88/rustfmt-clippy). This
builds for all three toolchains, `stable`, `beta` and `nightly`.

Note that the underlying distribution is currently Debian based.

## Executables included

- `cargo` and `rustc`
- `rustfmt` (i.e. `cargo fmt`)
- `clippy` (i.e. `cargo clippy`)

## Development libraries included

- `default-libmysqlclient-dev`
- `libpq-dev`
- `libsqlite3-dev`
- `libssl-dev`
- `libcurl4-openssl-dev`
- `zlib1g-dev`

## Scripts executed by CI

```bash
docker build \
    --build-arg RUST_CHANNEL=${RUST_CHANNEL} \
    -t guangie88/rustfmt-clippy:${RUST_CHANNEL} \
    .
```

The `latest` tag is deprecated since 6 July 2019, as such, it is recommended to
use `stable`, which corresponds to the `stable` toolchain of `rustup`.

If `nightly` toolchain must be used, then it is recommended to pin to
`nightly-yyyy-mm-dd`, where `yyyy-mm-dd` is the year/month/day nightly build
date, since `nightly` builds are possibly unstable across different dates.

## Acknowledgement

This repository is clearly inspired by:
[https://github.com/clux/muslrust](https://github.com/clux/muslrust), so thanks
to the author.
