#!/bin/sh

set -e
export PATH="$PATH:$(pwd)"

if [ ! -d "alpine-make-rootfs" ]; then
    git clone --depth 1 https://github.com/alpinelinux/alpine-make-rootfs
fi

if [ ! -f "apk" ]; then
    wget https://gitlab.alpinelinux.org/api/v4/projects/5/packages/generic/v2.14.0/x86_64/apk.static
    mv apk.static apk
    chmod +x apk
fi

./alpine-make-rootfs/alpine-make-rootfs -m https://mirrors.tuna.tsinghua.edu.cn/alpine/ --packages 'alpine-base' --script-chroot rootfs.tar.gz
docker import -m "$(sha256sum rootfs.tar.gz)" rootfs.tar.gz hzxjy/alpine:latest
rm rootfs.tar.gz

# ./apk --arch aarch64 -X ${mirror}/latest-stable/main -U --allow-untrusted -p ${chroot_dir} --initdb add alpine-base
