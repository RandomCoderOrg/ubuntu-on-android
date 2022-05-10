#!/usr/bin/env bash

DISTRO_NAME="udroid"
DISTRO_COMMENT="Ubuntu 22.10 Jammy"

# https://github.com/RandomCoderOrg/fs-cook/releases/download/v1.4/kinetic-raw-amd64.tar.gz

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/fs-cook/releases/download/v1.4/kinetic-raw-arm64.tar.gz"
TARBALL_SHA256['aarch64']="9839aa717729f323942bec517a760cc1631428be730554c3b589b4d0b0cf26f1"

TARBALL_URL['arm']="https://github.com/RandomCoderOrg/fs-cook/releases/download/v1.4/kinetic-raw-armhf.tar.gz"
TARBALL_SHA256['arm']="0b6f24b2c569b1b3c8ca437df91a1ee14e4285cf6abd1a2b6343dae704bb615a"

TARBALL_URL['amd64']="https://github.com/RandomCoderOrg/fs-cook/releases/download/v1.4/kinetic-raw-amd64.tar.gz"
TARBALL_SHA256['amd64']="1a0251e6d2a5059780f8f17b6e803c72f424f70f62350c4ee7f3bf7b037921d8"
