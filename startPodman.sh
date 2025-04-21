#!/bin/bash
# Run an action inside a clean container

IMAGE="ubuntu:22.04"                                                            # Os
TARGET_DIR_IN_CONTAINER="/root"                                                 # Mount directly to root's home
CONTAINER_NAME="gh-action-$(uuidgen | cut -d'-' -f1)"                           # Make a nice container name

sudo apt update              1>/dev/null 2>/dev/null
sudo apt install -y podman   1>/dev/null 2>/dev/null

echo "Starting Podman container: $CONTAINER_NAME"

podman run --rm -q  --name "$CONTAINER_NAME" -v "$PWD":"$TARGET_DIR_IN_CONTAINER" -w "$TARGET_DIR_IN_CONTAINER" "$IMAGE" bash run.sh

# Advantages
# Start in a clean state which shows the exact sequence of actions necessary to make the project run on a new system
# Isolation from other actions which might interact unexpectedly with each other making it difficult to debug what is happening
# Isolation from other prior runs which will leave the runner "dirty"
# Easier to debug because we are replicating the command line exactly rather than the complexities of a yml file that cannot be run so easily on the command line
# Less disk space as the container is deleted after every run
# Easy to add new runners for larger workloads

# Disadvantages
# Do not get the steps in the github log - replace with echo in color
