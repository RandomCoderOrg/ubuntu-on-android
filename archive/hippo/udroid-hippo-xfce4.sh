#!/usr/bin/env bash
##
## Plug-in for installing Hippo.
##

DISTRO_NAME="hippo"
DISTRO_COMMENT="[Testing] A ubuntu 21.04 port with some tweaks"

TARBALL_STRIP_OPT=0

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/ubuntu-on-android/releases/download/v01-xfce4/ubuntu-21.04-xfce4-rootfs-v01-arm64.tar.gz"
TARBALL_SHA256['aarch64']="e3bbb6f88cff4839fe6a607929708aa84b7fb2e1dc58a2d101471c4150c4447f"