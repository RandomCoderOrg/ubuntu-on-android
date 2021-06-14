##
## Plug-in for installing Hippo.
##

DISTRO_NAME="hippo"
DISTRO_COMMENT="[Testing] A ubuntu 21.04 port with some tweaks"

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
			rootfs="https://github.com/RandomCoderOrg/ubuntu-on-android/releases/download/v01-xfce4/ubuntu-21.04-xfce4-rootfs-v01-arm64.tar.gz"
			sha256="e3bbb6f88cff4839fe6a607929708aa84b7fb2e1dc58a2d101471c4150c4447f"
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

	# gl4es installer
	h_dir=root

	curl -o gl4es.sh https://raw.githubusercontent.com/RandomCoderOrg/ubuntu-on-android/gl4es-patch/etc/scripts/gl4es/script.sh
	cp ./root/.bashrc ./root/.bashrc1
	run_proot_cmd echo "echo \"Setting up gl4es...\"" >> ${h_dir}/.bashrc
    run_proot_cmd echo "bash /gl4es.sh" >> ${h_dir}/.bashrc
    run_proot_cmd echo "rm -rf /gl4es.sh" >> ${h_dir}/.bashrc
	run_proot_cmd echo "export LD_LIBRARY_PATH=/lib/gl4es" >> ${h_dir}/.bashrc1
	run_proot_cmd echo "rm -rf ~/.bashrc; mv ~/.bashrc1 ~/.bashrc" >> ${h_dir}/.bashrc
}
