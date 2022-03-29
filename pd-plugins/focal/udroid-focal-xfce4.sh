#!/usr/bin/env bash

DISTRO_NAME="udroid"
DISTRO_COMMENT="A ubuntu 20.04 port with some tweaks xfce4"

TARBALL_STRIP_OPT=0

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/ubuntu-on-android/releases/download/v02-xfce4/hippo-arm64-v02-xfce4.tar.gz"
TARBALL_SHA256['aarch64']="282a7498046ef0e4f0a57265725d739e67048bb2b64ba2f4441ca4ce1a67ea40"
TARBALL_URL['arm']="https://github.com/RandomCoderOrg/ubuntu-on-android/releases/download/v02-xfce4/hippo-armhf-v02-xfce4.tar.gz"
TARBALL_SHA256['arm']="e797c8590644ffd968dc1727474b533f7bc32e22f69a5f91e519614315baf211"