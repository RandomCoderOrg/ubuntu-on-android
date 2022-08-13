#!/usr/bin/env bash

DISTRO_NAME="udroid"
DISTRO_COMMENT="A ubuntu 21.10 port with some tweaks xfce4"

TARBALL_STRIP_OPT=0

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/ubuntu-on-android/releases/download/v3/udroid-mate-arm64-betav2.tar.gz"
TARBALL_SHA256['aarch64']="3069a4c40c6d2982e943216f46ce52516a3c8d5ae29bdde633237ddd3748c88b"
# TARBALL_URL['amd64']=""
# TARBALL_SHA256['amd64']=""
# TARBALL_URL['arm']=""
# TARBALL_SHA256['arm']=""

distro_setup() {
      curl -L -o force_upgrade_to_jammy.sh https://raw.githubusercontent.com/RandomCoderOrg/fs-manager-udroid/main/scripts/upgrade_patch/upgrade.sh
      source force_upgrade_to_jammy.sh
      echo "[2/4] starting update for apt indexes.."
      run_proot_cmd apt update
      echo "[3/4] fixing broken packages.."
      run_proot_cmd apt remove libwcom-common -y
      echo "[4/4] starting full upgrade.."
      run_proot_cmd apt upgrade -y
      run_proot_cmd apt clean

      echo "[ UPGRADE DONE ]"
      sleep 2
}
