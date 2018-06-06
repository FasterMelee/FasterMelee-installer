# Faster Melee Installer for Linux

A script for compiling Faster Melee on Linux. Current Version: **5.9**

Currently tested on Arch, Ubuntu, centOS 7.3, and others, but should work across *all* distributions given the right dependencies. Older versions can be found under `config/legacy/`.

[Join the official Faster Melee Discord Channel for support!](https://discord.gg/fastermelee)

## Dependencies needed (install these first!)
For most users, see [this page](https://wiki.dolphin-emu.org/index.php?title=Building_Dolphin_on_Linux) for an easy to install list of dependencies; otherwise, see below.

Fedora:

`dnf install cmake git gcc-c++ libXext-devel libgudev gtk+-devel wxGTK-devel systemd-devel openal-soft-devel libevdev-devel libao-devel SOIL-devel libXrandr-devel pulseaudio-libs-devel bluez-libs-devel libusb-devel`

Solus (possible list, untested):

`sudo eopkg it -c system.devel`

`sudo eopkg it libgtk-2-devel libgtk-3-devel wxwidgets-devel libsm-devel gtest-devel llvm-devel lzo-devel mbedtls-devel miniupnpc-devel libxrandr-devel libxi-devel alsa-lib-devel bluez-devel mesalib-devel curl-devel enet-devel libevdev-devel pulseaudio-devel libusb-devel openal-soft-devel portaudio-devel sdl2-devel SFML-devel soundtouch-devel git cmake pkg-config gcc readline-devel libxext-devel libao-devel`

**REQUIRED: Note that your distro may have different names for these packages!**
* ~~git~~ git is *NOT* required for this build, but is very helpful to have anyway; consider installing it!
* cmake
* pkg-config
* gcc (g++ >= 4.9)
* libwxbase3.0-dev
* libwxgtk3.0-dev
* libgtk2.0-dev
* libxext-dev
* libreadline-dev
* libgl1-mesa-dev
* libevdev-dev
* libudev-dev
* libusb-dev

**OPTIONAL:**
* libasound-dev
* libpulse-dev
* libao-dev
* libopenal-dev
* libavcodec-dev
* libavformat-dev
* libswscale-dev
* libbluetooth-dev
* libxrandr-dev

## To use:

```sh
sh -c "$(curl -Ls https://github.com/FasterMelee/FasterMelee-installer/raw/master/setup)"
```

If a different version is needed (e.g. not Discord/SL default), edit the script and replace the desired variables.

Packed config structure: main folder named `Binaries/`, with  `User/`, `Sys/`, `portable.txt`, and `version-####.txt`(optional) packed inside.

## Changelog

v1.9: Portability readded; switched back to tarballs w/ patching; removed date timestamp, now prompts to overwrite.

v1.8.2: Bug fixes, modularity added.

v1.8.1: Cleans out incomplete installations.

v1.8: Rewrote installer, now includes dual support for 5.0.3 and 5.5, with prompts for everything else.

v1.7: 5.5 support, added adapter setup support, later improved by /u/folfess.

v1.6: 5.0.3 support.

v1.5: Moved required files to GitHub for easier updates, edited RasterFont.cpp to prevent error. Credit: Mystro256, /u/74aaa92.

v1.4: Added general POSIX support, works on Debian now; changed libcurl to wget Credit: /u/folfess.

v1.3.reg1: Final version, attempting to avoid cloning Ishiiruka causes unfixable errors with netplay.

### Thanks to:

/u/ParadigmComplex. Seriously, I could not have finished the original script without this guy.

/u/jojorino and Hannesmann, always testing and helping, as well as the rest of the FM discord!

Also thanks to xanax, CilanMan, /u/algebra123230, /u/folfess for incremental improvements!

### Other resources:

[AUR package](https://aur.archlinux.org/packages/dolphin-emu-faster-melee/)

[PKGBUILDs for FM 5.0.3 and 5.0-321](https://github.com/ccl2of4/dolphin-emu-PKGBUILDs)
