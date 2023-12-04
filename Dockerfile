FROM ubuntu:22.04

# update and upgrade the image with the latest packages
RUN apt-get -y update && apt-get -y upgrade

# prepare the distribution for interactivity
RUN echo 'y' | /usr/local/sbin/unminimize

# install useful distro plumbing
RUN apt-get -y install iptables lsof socat rsync gnupg wslu ntpdate show-motd command-not-found

# install the packages essential for development
RUN apt-get -y install apt-utils sudo debianutils build-essential pkg-config man-db bash-completion

# generate the en_US locale
RUN apt-get -y install locales
RUN locale-gen en_US.UTF-8

# set the default timezone to America/Los_Angeles
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Los_Angeles apt-get -y install tzdata
RUN ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata
    
# install useful commands
RUN apt-get -y install vim nano curl wget gzip unzip tcpdump jq git

# delete the motd files that already exist
RUN rm /etc/update-motd.d/*

# copy configuration files and bash initialization scripts
COPY ./etc/wsl.conf /etc/wsl.conf
COPY ./etc/bash.bashrc /etc/bash.bashrc
COPY ./etc/bash.d /etc/bash.d

# copy executable files and scripts
COPY --chmod=0755 ./etc/update-motd.d /etc/update-motd.d
COPY --chmod=0755 ./files/npiperelay.exe /usr/bin/npiperelay.exe
COPY --chmod=0755 ./files/npiperelay.exe /usr/bin/wsl-notify-send.exe
COPY --chmod=0755 ./files/register /opt/register
