#!/bin/bash
# Run an action inside a clean container

IMAGE="ubuntu:22.04"                                                            # Os
TARGET_DIR_IN_CONTAINER="/root"                                                 # Mount directly to root's home
CONTAINER_NAME="gh-action-$(uuidgen | cut -d'-' -f1)"                           # Make a nice container name

echo "Starting Docker container: $CONTAINER_NAME"

docker run --rm -q  --name "$CONTAINER_NAME" -v "$PWD":"$TARGET_DIR_IN_CONTAINER" -w "$TARGET_DIR_IN_CONTAINER" "$IMAGE" bash run.sh
