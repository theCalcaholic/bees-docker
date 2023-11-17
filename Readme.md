# Bees docker

## Description

Docker image build recipe for [bees](https://zygo.github.io/bees/).

Since bees only has installable packages for Arch and Gentoo, I created a very simple Dockerfile to be distro independent for my btrfs deduplication needs.

The container is nothing but a simple wrapper around the beesd script provided by bees.

## Usage

1. Clone this repository and cd into it
    ```sh
    git clone https://github.com/theCalcaholic/bees-docker
    cd bees-docker
    ```
2. Build the docker container
    ```sh
    docker build -t beesd .
    ```
3. Create a config file for beesd
    ```sh
    sudo mkdir -p /etc/bees
    sudo wget -O /etc/bees/my-disk.conf https://github.com/Zygo/bees/blob/master/scripts/beesd.conf.sample
    # then edit at least the UUID in /etc/bees/my-disk.conf
    ```
4. Run the docker container in privileged mode
    ```sh
    docker run --rm --privileged -v /dev/disk:/dev/disk -v /etc/bees:/etc/bees beesd <uuid-of-your-btrfs-root-volume>
    ```
