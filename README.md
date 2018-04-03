# rustfmt-clippy

Includes two Dockerfiles to include rustc, cargo, rustfmt and clippy, meant to
be executable for any user. Both Dockerfiles are based on `ubuntu:xenial`.

The non-suffixed `git-master` image performs `cargo install rustfmt` and
`cargo install clippy`. The suffixed `git-master` image performs `git checkout`
for both `rustfmt` and `rust-clippy` at `master` branch, and performs
compilation and installation from there.

Periodically run by CI to automatically push valid Docker images into the
[Docker registry](https://hub.docker.com/r/guangie88/rustfmt-clippy).

This repository is clearly inspired by:
[https://github.com/clux/muslrust](https://github.com/clux/muslrust), so thanks
to the author.

This should hopefully help to get an easy-to-use working Rust formatting and
code linting environment set-up for CI/CD.

## Scripts executed by CI

```bash
docker build \
    --build-arg RUST_CHANNEL=${RUST_CHANNEL} \
    -t guangie88/rustfmt-clippy
    cargo-install/
```

```bash
docker build \
    --build-arg RUST_CHANNEL=${RUST_CHANNEL} \
    -t guangie88/rustfmt-clippy-git-master
    git-install/
```

If any of the builds fails due to the instability of `rustc` nightly compiler
and `clippy`, the image will not be pushed into the Docker registry.

## Development libraries included for both set-ups

* `libssl-dev`
* `libcurl3`
* `libpq-dev`
* `libsqlite3-dev`
* `zlib1g-dev`
