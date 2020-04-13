# rustfmt-clippy

Builds a Rust environment Docker image to get an easy-to-use working code
formatting and linting set-up for CI/CD, executable for any user. This fork
also contains `cargo audit` for looking up security vulnerabilities in 
the RustSec database.

Periodically run by CI to automatically push valid Docker images into the
[Docker registry](https://hub.docker.com/r/passfort/rust-clippy-audit).
This currently builds only for `stable`.

Note that the underlying distribution is currently Debian based.

## Executables included

- `cargo` and `rustc`
- `rustfmt` (i.e. `cargo fmt`)
- `clippy` (i.e. `cargo clippy`)
- `cargo-audit` (i.e. `cargo audit`)

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
    -t passfort/rust-clippy-audit:${RUST_CHANNEL} \
    .
```

## Acknowledgement

This repository is clearly inspired by:
[https://github.com/clux/muslrust](https://github.com/clux/muslrust), so thanks
to the author.
