# version-1
##
## Plug-in for installing Hippo.
##

DISTRO_NAME="hippo-raw"
DISTRO_COMMENT="untouched ubuntu 21.04 rootfs from cdimage ubuntu"

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
			rootfs="https://github.com/SaicharanKandukuri/ubuntu-on-android/releases/download/v1-raw/ubuntu-base-21.04-base-arm64.tar.gz"
			sha256="a8cf4f08008cdbb032cbef6a9acda64ec3752e83e6605dfe5c84165298af0f49"
			;;
			armv7l|armv8l)
			rootfs="https://github.com/SaicharanKandukuri/ubuntu-on-android/releases/download/v1-raw/ubuntu-base-21.04-base-armhf.tar.gz"
			sha256="32f4be0a13feb17ebb9d27da79900bbdde98d9322538ade8208c3e23879a950f"
			;;
			x86_64)
			rootfs="https://github.com/SaicharanKandukuri/ubuntu-on-android/releases/download/v1-raw/ubuntu-base-21.04-base-amd64.tar.gz"
			sha256="2ff4bcce53da9bc231348bb8b0b7490eb994bc5c7407555d27e5d318deaeb92c"
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