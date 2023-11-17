FROM archlinux:latest

RUN pacman -Sy --noconfirm bash bees btrfs-progs
RUN mkdir -p /mnt

ENTRYPOINT ["beesd"]

