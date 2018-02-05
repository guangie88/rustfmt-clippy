# rustfmt-clippy

Dockerfile to include rustc, cargo, rustfmt and clippy, executable for any user.

This is meant to be periodically run by CI to automatically push valid Docker
images into the Docker registry.

This repository is clearly inspired by:
[https://github.com/clux/muslrust](https://github.com/clux/muslrust), but
the purpose is to have a quick way to get a working Rust linting environment
set-up for CI/CD.

## Script executed by CI

```bash
docker build -t --build-arg RUST_CHANNEL=${RUST_CHANNEL} guangie88/rustfmt-clippy .
```

If the build fails, which can be quite frequent because of instability of
both the `rustc` compiler and `clippy`, the image will fail to be built.
