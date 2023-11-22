# This needs to be run from windows

param(
  [Parameter(Mandatory=$true, Position=0)]
  [string]$distro_name = "Test",
  [Parameter(Mandatory=$true, Position=1)]
  [string]$image_file = "wsl-ubuntu-22.04.tar.gz"
)

# Import the image we just created
wsl --import $distro_name . $image_file

# Run it (this blocks until we exit)
wsl --distribution $distro_name

# Stop the execution of the container
wsl --terminate $distro_name

# Destory the image
wsl --unregister $distro_name
