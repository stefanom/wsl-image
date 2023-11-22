#!/bin/bash

# Stop if anything fails
set -euo pipefail

IMAGE='wsl-ubuntu-22.04'

# Make sure docker exists and if not show how to install it
if ! command -v docker &> /dev/null; then
    echo "Error: docker is not available. Have you installed it?"
    exit 1
fi

echo "==> Building the image..."
docker build -t $IMAGE .

echo "==> Creating the container..."
docker run --name $IMAGE $IMAGE

echo "==> Exporting the image..."
docker export $IMAGE | gzip > $IMAGE.tar.gz

echo "==> Cleaning up..."
docker rm $IMAGE
docker rmi $IMAGE

filesize=$(du -m $IMAGE.tar.gz | awk '{print $1}')

echo ""
echo "==> The WSL image is at $IMAGE.tar.gz [$filesize Mb]"
