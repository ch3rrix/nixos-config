{ config, pkgs, ... }:
{
  imports = [
    ./bspwm

    ./dunst.nix
    ./rofi.nix
    ./polybar.nix
#   ./screen-lock.nix
    ./xss-lock.nix
  ];
}
