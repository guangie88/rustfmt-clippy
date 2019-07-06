#!/usr/bin/env bash
set -euo pipefail

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

RUST_DATE=$(docker run -it "$IMAGE_NAME" rustc --version |
    grep -oE "[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")

RUST_VER=$(docker run -it "$IMAGE_NAME" rustc --version |
    grep -oE "[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]")

TAG1="$RUST_VER-$RUST_CHANNEL"
docker tag "$IMAGE_NAME" "$IMAGE_NAME:$TAG1"
docker push "$IMAGE_NAME:$TAG1"

TAG2="$RUST_CHANNEL"
docker tag "$IMAGE_NAME" "$IMAGE_NAME:$TAG2"
docker push "$IMAGE_NAME:$TAG2"

if [ "$RUST_CHANNEL" = "nightly" ]; then
    TAG3="$RUST_CHANNEL-$RUST_DATE"
    docker tag "$IMAGE_NAME" "$IMAGE_NAME:$TAG3"
    docker push "$IMAGE_NAME:$TAG3"
fi 
