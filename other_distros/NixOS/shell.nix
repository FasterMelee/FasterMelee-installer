{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {

  glib = glib.out;
  gtk2 = gtk2;

  buildInputs = [ bluez ffmpeg libao libGLU_combined gtk2 glib gettext
  xorg.libpthreadstubs xorg.libXrandr xorg.libXext xorg.libX11
  xorg.libSM readline openal libevdev xorg.libXdmcp portaudio libusb
  libpulseaudio gnumake wxGTK31 soundtouch miniupnpc mbedtls curl lzo
  sfml pkgconfig cmake ];


}
