##
## MAIN SCRIPT FOR INSTALLING FURTHER CMDS
##

##Adding a vncserver command
echo "vncserver -kill :* && rm -rf /tmp/.X*-lock && tigervncserver -geometry 1280x720 -xstartup /usr/bin/starrxfce4 -listen tcp :1" > /data/data/com.termux/files/usr/varlib/proot-distro/installed-rootfs/hippo/usr/bin/vncserver-start;
# Making it executable
chmod +x  /data/data/com.termux/files/usr/varlib/proot-distro/installed-rootfs/hippo/usr/bin/vncserver-start;

# Adding script for sound...
echo "pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1" > $PREFIX/bin/pulseserver-start
# Making it executable
chmod +x $PREFIX/bin/pulseserver-start

# Adding sound to .bashrc
echo "export PULSE_SERVER=127.0.0.1 >> /data/data/com.termux/files/usr/varlib/proot-distro/installed-rootfs/root/.bashrc

# Just useful
echo "export DISPLAY=:1" >> data/data/com.termux/files/usr/varlib/proot-distro/installed-rootfs/hippo/root/.bashrc


