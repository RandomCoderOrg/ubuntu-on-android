#!/usr/bin/env bash

DISTRO_NAME="jammy"
DISTRO_COMMENT="A ubuntu 22.04 port by udroid"

TARBALL_STRIP_OPT=0

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/fs-cook/releases/download/v1.1/jammy-raw-arm64.tar.gz"
TARBALL_SHA256['aarch64']="150c596762e3afde11d10b1917192491c9685481b161756a990a440551d01187"
TARBALL_URL['arm']="https://github.com/RandomCoderOrg/fs-cook/releases/download/v1.1/jammy-raw-armhf.tar.gz"
TARBALL_SHA256['arm']="b7740025794f23754d35338db1339c51257200190b6b8d33d907794c9d663b1f"
TARBALL_URL['amd64']="https://github.com/RandomCoderOrg/fs-cook/releases/download/v1.1/jammy-raw-amd64.tar.gz"
TARBALL_SHA256['amd64']="ff3eab7fcf7fe4898016119913fad7393f5f308192fc10d39a879c5fa3f03026"

distro_setup() {
    target_dir="/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/udroid-jammy-raw"
    SUITE="jammy"
    
    case $(dpkg --print-architecture) in
        arm64|i386)
            MIRROR="http://archive.ubuntu.com/ubuntu/"
        ;;
        *)
            MIRROR="http://ports.ubuntu.com/ubuntu-ports/"
        ;;
    esac

cat <<- EOF > "$target_dir/etc/apt/sources.list"
# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb $MIRROR $SUITE main restricted
# deb-src $MIRROR $SUITE main restricted
## Major bug fix updates produced after the final release of the
## distribution.
deb $MIRROR $SUITE-updates main restricted
# deb-src $MIRROR $SUITE-updates main restricted
## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb $MIRROR $SUITE universe
# deb-src $MIRROR $SUITE universe
deb $MIRROR $SUITE-updates universe
# deb-src $MIRROR $SUITE-updates universe
## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team, and may not be under a free licence. Please satisfy yourself as to
## your rights to use the software. Also, please note that software in
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
deb $MIRROR $SUITE multiverse
# deb-src $MIRROR $SUITE multiverse
deb $MIRROR $SUITE-updates multiverse
# deb-src $MIRROR $SUITE-updates multiverse
## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
deb $MIRROR $SUITE-backports main restricted universe multiverse
# deb-src $MIRROR $SUITE-backports main restricted universe multiverse
EOF

}