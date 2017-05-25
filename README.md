# Faster Melee Installer for Linux

A script for compiling the latest version of Faster Melee (currently **5.0.3** with netplay support) on various Linux distributions.

Currently tested on Arch and Ubuntu 17.04.

[Join the official Faster Melee Discord Channel for support!](https://discord.gg/h6C4tCj)

## Dependencies needed (install these first!)
See [this page](https://wiki.dolphin-emu.org/index.php?title=Building_Dolphin_on_Linux) for what exactly your distro needs!

In general, you need g++ (version >= 4.9), git, build-essential, cmake, make, libgl-mesa-dev (or equivalent), libopenal, and libsoundtouch!

DEBIAN JESSIE users note: `libavformat-dev` must be installed from jessie-backports to avoid errors.

## To use:

```bash
wget "https://github.com/Ptomerty/FasterMelee-installer/raw/master/setup"
bash setup
```

## Changelog
v1.3~reg1: Final version, attempting to avoid cloning Ishiiruka causes unfixable errors with netplay.

v1.4: Added /bin/sh support, works on debian now; changed to wget Credit: /u/folfess.

v1.5: Moved required files to GitHub for easier updates, edited RasterFont.cpp to prevent error. Credit: Mystro256, /u/74aaa92.

v1.6: 5.0.3 support.

### Thanks to:
/u/ParadigmComplex. Seriously could not have done it without this guy.

Also thanks to xanax, CilanMan, /u/algebra123230, /u/folfess, and /u/jojorino!

### Other resources:

[AUR package for Faster Melee](https://aur.archlinux.org/packages/dolphin-emu-faster-melee/)

[Ubuntu 16.04 .deb for Faster Melee](https://github.com/ccl2of4/dolphin-emu-faster-melee-packaging/releases)
