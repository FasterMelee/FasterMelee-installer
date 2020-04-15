{ stdenv, pkgconfig, cmake, bluez, ffmpeg, libao, gtk2, glib, libGLU_combined
, gettext, libpthreadstubs, libXrandr, libXext, libX11, libSM, readline, openal
, libXdmcp, portaudio, fetchFromGitHub, libusb, libevdev, automake, autobuild
, wxGTK31, soundtouch, miniupnpc, mbedtls, curl, lzo, sfml, gnumake
, writeShellScriptBin, symlinkJoin, libpulseaudio ? null, sys ? null, user ? null }:

# the optional sys and user parameters are paths to the respective directories for dolphin
# if not given dolphin will just use the default fastermelee sys and user dirs
# passing custom sys and user directories may be useful for installing project m

let
  # there are 2 wrapper scripts that will copy the necessary config files to $HOME/.config
  # fastermelee is always called with the -u option so it reads the correct user dir
  fastermelee = writeShellScriptBin "fastermelee-5.8.7" ''
    config=$HOME/.config
    if [ ! -z "$XDG_CONFIG_HOME" ]; then
        config="$XDG_CONFIG_HOME"
    fi
    if [ ! -d $config/fastermelee-5.8.7 ] ; then
        mkdir -p $config
        cp -r ${fastermelee-dolphin}/share/dolphin-emu/user $config/fastermelee-5.8.7
        chmod -R +w $config/fastermelee-5.8.7
    fi
    ${fastermelee-dolphin}/bin/fastermelee-5.8.7 -u $config/fastermelee-5.8.7 $@
  '';


  fastermelee-nogui = writeShellScriptBin "fastermelee-5.8.7-nogui" ''
    config=$HOME/.config
    if [ ! -z "$XDG_CONFIG_HOME" ]; then
        config="$XDG_CONFIG_HOME"
    fi
    if [ ! -d $config/fastermelee-5.8.7 ] ; then
        mkdir -p $config
        cp -r ${fastermelee-dolphin}/share/dolphin-emu/user $config/fastermelee-5.8.7
        chmod -R +w $config/fastermelee-5.8.7
    fi
    ${fastermelee-dolphin}/bin/fastermelee-5.8.7-nogui $@
  '';

  fasterMeleeConfig = builtins.fetchTarball {
    url = https://github.com/FasterMelee/FasterMelee-installer/raw/master/config/legacy/5.8.7-fmconfig.tar.gz;
    sha256 = "1a3yk289jzfhapymksr4nj4np6hxm78h20mrjd6mqs2q0y9vvmv3";
  };

  sysDir = if sys== null then
             "${fasterMeleeConfig}/Sys"
           else
             sys;


  userDir = if user == null then
             "${fasterMeleeConfig}/User"
           else
             user;


  fastermelee-dolphin = stdenv.mkDerivation rec {
    name = "FasterMelee-base";
    version = "5.8.7";

    src = fetchFromGitHub {
      owner  = "FasterMelee";
      repo   = "Ishiiruka";
      rev = "98ebbc166beee649bd23066ce91ba1d88e73861c";
      sha256 = "15wwkv5cn9dxdmqmzmpncq7myg6q5v53ql5hrplpglpp3gkhs9di";
    };

    postPatch = builtins.readFile ./postpatch;

    cmakeFlags = ''
      -DGTK2_GLIBCONFIG_INCLUDE_DIR=${glib.out}/lib/glib-2.0/include
      -DGTK2_GDKCONFIG_INCLUDE_DIR=${gtk2.out}/lib/gtk-2.0/include
      -DGTK2_INCLUDE_DIRS=${gtk2.dev}/lib/gtk-2.0
      -DENABLE_LTO=True

    '';

    postInstall = ''
      rm -r "$out/share/dolphin-emu/sys"
      cp -r "${userDir}" "$out/share/dolphin-emu/user/"
      cp -r "${sysDir}" "$out/share/dolphin-emu/sys/"
      mv "$out/bin/dolphin-emu" "$out/bin/fastermelee-5.8.7"
      mv "$out/bin/dolphin-emu-nogui" "$out/bin/fastermelee-5.8.7-nogui"
    '';

    enableParallelBuilding = true;

    nativeBuildInputs = [ pkgconfig cmake ];

    buildInputs = [ bluez ffmpeg libao libGLU_combined gtk2 glib
    gettext libpthreadstubs libXrandr libXext libX11 libSM readline
    openal libevdev libXdmcp portaudio libusb libpulseaudio gnumake
    wxGTK31 soundtouch miniupnpc mbedtls curl lzo sfml ];

  };

in
  symlinkJoin {
  name = "fastermelee-5.8.7";
  paths = [
    fastermelee
    fastermelee-nogui
    fastermelee-dolphin
  ];
}
