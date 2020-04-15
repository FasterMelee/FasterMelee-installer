{ pkgs ? import <nixpkgs> {}, sys ? null, user ? null, }:

with pkgs;
{
  fastermelee-5-9 = callPackage ./fastermelee-5.9 { inherit sys user; };
  fastermelee-5-8-7 = callPackage ./fastermelee-5.8.7 { inherit sys user; };

}
