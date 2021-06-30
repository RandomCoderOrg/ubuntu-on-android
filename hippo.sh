##
## Plug-in for installing Hippo.
##

DISTRO_NAME="hippo"
DISTRO_COMMENT="A ubuntu 21.04 port with some tweaks xfce4"

# You can override a CPU architecture to let distribution
# be executed by QEMU (user-mode).
#
# You can specify the following values here:
#
#  * aarch64: AArch64 (ARM64, 64bit ARM)
#  * armv7l:  ARM (32bit)
#  * i686:    x86 (32bit)
#  * x86_64:  x86 (64bit)
#
# Default value is set by proot-distro script and is equal
# to the CPU architecture of your device (uname -m).
#DISTRO_ARCH=$(uname -m)

# Returns download URL and SHA-256 of file in this format:
# SHA-256|FILE-NAME
get_download_url() {
	local rootfs
	local sha256

	case "$DISTRO_ARCH" in
		aarch64)
			rootfs="https://github.com/RandomCoderOrg/ubuntu-on-android/releases/download/v02-xfce4/hippo-arm64-v02-xfce4.tar.gz"
			sha256="282a7498046ef0e4f0a57265725d739e67048bb2b64ba2f4441ca4ce1a67ea40"
			armv7l|armv8l)
			rootfs="https://github.com/RandomCoderOrg/ubuntu-on-android/releases/download/v02-xfce4/hippo-armhf-v02-xfce4.tar.gz"
			sha256="e797c8590644ffd968dc1727474b533f7bc32e22f69a5f91e519614315baf211"
			;;
	esac

	echo "${sha256}|${rootfs}"
}


distro_setup() {
	# Hint: $PWD is the distribution rootfs directory.
	#echo "hello world" > ./etc/motd

	# Run command within proot'ed environment with
	# run_proot_cmd function.
	# Uncomment this to do system upgrade during installation.
	#run_proot_cmd apt update
	#run_proot_cmd apt upgrade -yq
	:
}
