{ pkgs ? import <nixpkgs> {}, sys ? null, user ? null, }:

with pkgs;
{
  fastermelee-5-9 = callPackage ./fastermelee-5.9 { inherit sys user; };

}
