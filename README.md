# wsl-image

This folder contains scripts and instructions to generate a personalized WSL Ubuntu image.

To make the image type:

```shell
> ./build_image.sh
```

To test the image, open a Powershell (in Windows) and execute

```shell
PS> .\test.ps1
```

To install the image type

```shell
wsl --import <name> <destination> /path/to/wsl-ubuntu-22.04.tar.gz
```

To bootstrap configs type

```shell
curl --proto '=https' --tlsv1.2 -sSf https://gist.githubusercontent.com/stefanom/91db0ff9858c6b1ca731babb6f6bb3f5/raw/0e387a0cc6e49b5e493d9181ac60260a20cc1bdb/bootstrap.sh | bash
```

NOTE: make sure you have 1password acting as ssh-agent or the above won't be able to connect to github.
