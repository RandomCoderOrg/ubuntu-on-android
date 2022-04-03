#!/usr/bin/env bash

DISTRO_NAME="udroid"
DISTRO_COMMENT="Ubuntu 22.04 Jammy"

TARBALL_STRIP_OPT=0

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/fs-cook/releases/download/v1.3/jammy-raw-arm64.tar.gz"
TARBALL_SHA256['aarch64']="ff977096392e19a82a492cf5681f19c03108873aa8c0709cf6c06efdc4a5f6af"

TARBALL_URL['arm']="https://github.com/RandomCoderOrg/fs-cook/releases/download/v1.3/jammy-raw-armhf.tar.gz"
TARBALL_SHA256['arm']="f7ec97256bd36927a5e37b7a4dece9cc35fc9d5a9b9bd8b183294dea4e65b1d2"

TARBALL_URL['amd64']="https://github.com/RandomCoderOrg/fs-cook/releases/download/v1.3/jammy-raw-amd64.tar.gz"
TARBALL_SHA256['amd64']="12b6008a0e0db32f7cb12fdb4bc600650e0c6a03cf683a40435bb06473c93612"