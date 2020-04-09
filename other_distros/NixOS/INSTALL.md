There are 3 ways to install fastermelee on nixos:

1. To install locally, just run `nix-shell` in this directory then execute the setup script

2. To install globally, run `nix-env -f ./default.nix -iA fastermelee-5-9` or add `(callPackage /path/to/fastermelee-5.9 {})` to `environment.systemPackages`. You can launch dolphin with the command `fastermelee` or `fastermelee-nogui`.

3. If you just want to try it out you can run `nix-build` in this directory. The executables will be in `./result/bin`.

No matter how you install, be sure to add the following lines to your configuration.nix in order to get gamecube adapters to work:

```
services.udev.extraRules = ''
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666";
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="2300", SYMLINK+="model01", ENV{ID_MM_DEVICE_IGNORE}:="1", ENV{ID_MM_CANDIDATE}:="0";
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="2301", SYMLINK+="model01", ENV{ID_MM_DEVICE_IGNORE}:="1", ENV{ID_MM_CANDIDATE}:="0";
'';
```

If installed using methods 2 or 3, the `Sys` directory is copied to the nix store and will be read-only. The `User` directory will be in `$XDG_CONFIG_HOME/fastermelee` with write permission. To use a custom `Sys` or `User` directory, you can install by running:<br/>
`nix-env -f ./default.nix -iA fastermelee-5-9 --arg sys /path/to/sys --arg user /path/to/user`<br/>
or adding<br/>
`(callPackage /path/to/fastermelee-5.9 { sys = /path/to/Sys; user = /path/to/User; })` to `environment.systemPackages`<br/>
or running<br/>
`nix-build -E 'with import <nixpkgs> { }; callPackage ./fastermelee-5.9 { sys = /path/to/Sys; user = /path/to/User; }'`<br/>
