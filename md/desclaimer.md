## Note & Disclaimer!

**A note before you try**
- As lot of it is preinstalled you can login and start right after you install.
- Before installation, be sure that you're on stable internet and your device have 5-6gb free space for neat installation.
- As this runs on termux and on software rendering so performance clearly depends on CPU, ram and storage read-write speed!
- Consider not to try heavy apps unless you got a good device.
- If you have any issues or suggestions make sure i know at https://github.com/RandomCoderOrg/ubuntu-on-android/issue (create an issue)

**Disclaimer**
- I dont work with any company or organization of ubuntu or any third party sources took in making fs(for now).
- This project works by compliying to selinux android. and all aim of the project is just run linux on android without direct root with a twist and this project improves time by time with your support and motivation.
- the linux you trying to install from this repo is not fully functional in target space because of the selinux policies, and increasing requirement in linux requirements and also because project is set to run with `ptrace()` a low level access in android kernel
- Graphics performence is really bad cause proot and usage on VNC, we dont support any adoptation on improving it **for now** cause insufficient data on android (ping me in discord if you have any ideas or any codes on this) 
- **(Update)** see https://github.com/RandomCoderOrg/ubuntu-on-android/wiki/XWayland-in-proot to run smooth and fast session
- This project comes without warranties or data protection
- The Linux you're trying to install from this repo is not fully functional in the target space because of the SELinux policies, and increasing requirement in Linux requirements, and also because the project is set to run with ptrace() low-level access in android kernel 
- That lead to:
- No direct access to hardware, fluctuations in services, performance overheads, sudo issues etc.

**Display**
- Access to display/control Desktop environment can be accomplished by various methods like
- Termux:Wayland **Recommended**
- xRDP
- Vncserver ( RealVnc Viewer, Bvnc, Nethunter Vnc etc )
- Xserver XSDL

**Audio**
- Audio works by enabling pulseserver with a tcp reciver module at `127.0.0.1` and `udroid` manager takes care on starting audio service ( additional setup mamy require for some apps ).

**HID interfaces**
- Keyboard and mouse emulation depends on apps you use to access desktop environment. Bvnc/nethunter KEX app provides better interface with hardware and mouse

**Graphics**
- For this time being there is no standardized way of accessing or using device GPU at it's full potential so llvm pipes are used! (OpenGl version may depend on device OS). Most of the solutions are tricks to get more performence or vendor specific implementaions (like kernel graphics support layer/DRI ).
- Best way to experience native linux like performence is using Termux:Wayland app which is wayland port to android

**Others**
- PRoot for android is still in devoloping stage and not ready for using daily life linux. all the linux codes and apps are not devoloped for PRoot. popular apps like snap flatpack which depends on Systemd (which is not possible without root and Hallium project in android) wont work. proot on android platform is devoloping mostly by the efforts of termux and many random devolopers and big part of linux/android user community. this projects is also result of so many experiments and mixture of hacks and tricks to start things in android.
