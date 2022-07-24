#!/usr/bin/env bash

DISTRO_NAME="udroid"
DISTRO_COMMENT="A ubuntu 21.10 port with some tweaks xfce4"

TARBALL_STRIP_OPT=0

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/ubuntu-on-android/releases/download/v3/udroid-arm64-xfce4-V3MBB2.tar.gz"
TARBALL_SHA256['aarch64']="617dc4b18bd27b181ebabeadf8964f23b6e8087da75c253ead88dba1e7931f1d"
TARBALL_URL['x86_64']="https://github.com/RandomCoderOrg/ubuntu-on-android/releases/download/v3/udroid-xfce4-impish-v3-build01.tar.gz"
TARBALL_SHA256['x86_64']="88a5f5f079aef994b6d5b2e3df773aa875ed2157d1f00c8fda504bda9f01e680"

distro_setup() {
      curl -L -o force_upgrade_to_jammy.sh https://raw.githubusercontent.com/RandomCoderOrg/fs-manager-udroid/main/scripts/upgrade_patch/upgrade.sh
      source force_upgrade_to_jammy.sh
}
