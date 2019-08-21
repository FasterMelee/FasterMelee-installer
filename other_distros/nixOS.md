# nixOS Installation Guide

### 1. run nix-shell in the project root

### 2. run the setup script

### 1. Adapter support
Add this snippet to /etc/nixos/configuration.nix:
```
    services.udev.extraRules = ''
      SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666";
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="2300", SYMLINK+="model01", ENV{ID_MM_DEVICE_IGNORE}:="1", ENV{ID_MM_CANDIDATE}:="0";
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="2301", SYMLINK+="model01", ENV{ID_MM_DEVICE_IGNORE}:="1", ENV{ID_MM_CANDIDATE}:="0";
    '';
```

### 2. Modify the setup script: 
 * remove or comment out lines 7-14 and lines 112-122
 * append these cmakeflags in line 223: 
 ```
 -DGTK2_GLIBCONFIG_INCLUDE_DIR=${glib}/lib/glib-2.0/include -DGTK2_GDKCONFIG_INCLUDE_DIR=${gtk2}/lib/gtk-2.0/include -DGTK2_INCLUDE_DIRS=${gtk2}-dev/include/gtk-2.0 -DENABLE_LTO=True
 ```

### 3. run nix-shell with the [shell.nix](./shell.nix) (meaning run it in the same folder the shell.nix sits)

### 4. run the setup script
