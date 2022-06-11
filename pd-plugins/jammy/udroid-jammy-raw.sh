#!/usr/bin/env bash

DISTRO_NAME="udroid"
DISTRO_COMMENT="Ubuntu 22.04 Jammy"

TARBALL_STRIP_OPT=0

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/udroid-download/releases/download/V3R3/jammy-raw-arm64.tar.gz"
TARBALL_SHA256['aarch64']="5e041e094eaf175a8a76ebf30f911aad043da53c9e54012eb8c4a69e27550518"

TARBALL_URL['arm']="https://github.com/RandomCoderOrg/udroid-download/releases/download/V3R3/jammy-raw-armhf.tar.gz"
TARBALL_SHA256['arm']="df811e5010cbb07e05db78aa1dc1deecd3139deae8704be31a4db7d23d3efccf"

TARBALL_URL['amd64']="https://github.com/RandomCoderOrg/udroid-download/releases/download/V3R3/jammy-raw-amd64.tar.gz"
TARBALL_SHA256['amd64']="2102530b19b69b0c70c26e09915c58b58486e5df53c4c8706084b11744d010d1"
