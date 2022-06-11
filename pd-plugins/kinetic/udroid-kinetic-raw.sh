#!/usr/bin/env bash

DISTRO_NAME="udroid"
DISTRO_COMMENT="Ubuntu 22.10 Jammy"
TARBALL_STRIP_OPT=0

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/udroid-download/releases/download/V3R3/kinetic-raw-arm64.tar.gz"
TARBALL_SHA256['aarch64']="caa2f399fa58b70125a066de47e5256238dee4abf5a11846a8ed39da811832fc"

TARBALL_URL['arm']="https://github.com/RandomCoderOrg/udroid-download/releases/download/V3R3/kinetic-raw-armhf.tar.gz"
TARBALL_SHA256['arm']="00d77cab9998a2bdec8d28765fff85c5967ff8abcbbe1fc9fc7e1930b362bd3a"

TARBALL_URL['amd64']="https://github.com/RandomCoderOrg/udroid-download/releases/download/V3R3/kinetic-raw-arm64.tar.gz"
TARBALL_SHA256['amd64']="2ec5079703464e8bc7190c7f1024a782724c20fe0d01a172aafa2e2cd88f64d8"

distro_setup() {
  run_proot_cmd apt-get update
  run_proot_cmd apt-get upgrade -y
 }
