#!/bin/bash

if ! command -v go &> /dev/null; then
    echo "Error: go is not installed."
    echo "Type 'sudo apt install golang-go' to install it."
    exit 1
fi

git clone https://github.com/jstarks/npiperelay.git
cd npiperelay
GOOS=windows go build -ldflags "-w -s" -o ../npiperelay.exe github.com/jstarks/npiperelay
cd ..
rm -rf npiperelay
