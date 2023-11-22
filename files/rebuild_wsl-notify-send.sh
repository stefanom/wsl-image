#!/bin/bash

if ! command -v go &> /dev/null; then
    echo "Error: go is not installed."
    echo "Type 'sudo apt install golang-go' to install it."
    exit 1
fi

git clone https://github.com/stuartleeks/wsl-notify-send.git
cd wsl-notify-send
GOOS=windows go build -ldflags "-w -s" -o ../wsl-notify-send.exe github.com/stuartleeks/wsl-notify-send
cd ..
rm -rf wsl-notify-send
