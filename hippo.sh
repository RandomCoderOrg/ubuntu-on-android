##
## Plug-in for installing Hippo.
##

DISTRO_NAME="hippo"
DISTRO_COMMENT="[Testing] A ubuntu 21.04 port with some tweaks"

TARBALL_STRIP_OPT=0

TARBALL_URL['aarch64']="https://github.com/RandomCoderOrg/ubuntu-on-android/releases/download/v01-xfce4/ubuntu-21.04-xfce4-rootfs-v01-arm64.tar.gz"
TARBALL_SHA256['aarch64']="e3bbb6f88cff4839fe6a607929708aa84b7fb2e1dc58a2d101471c4150c4447f"


distro_setup() {

	run_proot_cmd apt update

	# Due to a reason cmake i set to install here
	# Get resolved in next fs-build
	run_proot_cmd apt install -y cmake

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
