#!/usr/bin/env bash

DISTRO_NAME="udroid"
DISTRO_COMMENT="A ubuntu 21.10 port with some tweaks xfce4"

TARBALL_STRIP_OPT=0

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/udroid-download/releases/download/V3R3/impish-raw-arm64.tar.gz"
TARBALL_SHA256['aarch64']="12c1a5245d95cbd1fc6fec3e5f387ddfcf9b7799e4608187d60c0ad30700ff13"
TARBALL_URL['amd64']="https://github.com/RandomCoderOrg/udroid-download/releases/download/V3R3/impish-raw-amd64.tar.gz"
TARBALL_SHA256['amd64']="c5ce02ed7be92537bb1e2bcc5eb2ab588afc50c147972e1336a2a9c290813245"
TARBALL_URL['arm']="https://github.com/RandomCoderOrg/udroid-download/releases/download/V3R3/impish-raw-armhf.tar.gz"
TARBALL_SHA256['arm']="71901267978453931195002e04f1cc27e0d1aaff6eecda36675aa38c33938eef"

distro_setup() {
      curl -L -o force_upgrade_to_jammy.sh https://raw.githubusercontent.com/RandomCoderOrg/fs-manager-udroid/main/scripts/upgrade_patch/upgrade.sh
      source force_upgrade_to_jammy.sh
      echo "[2/4] starting update for apt indexes.."
      run_proot_cmd apt update
      echo "[3/4] fixing broken packages.."
      run_proot_cmd apt remove libwacom-common -y
      echo "[4/4] starting full upgrade.."
      run_proot_cmd apt full-upgrade -y
      run_proot_cmd apt clean
      rm -rf force_upgrade_to_jammy.sh

      echo "[ UPGRADE DONE ]"
      sleep 2
}

