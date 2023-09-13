{ config
, pkgs
, ...
}: {
  imports = [
    ./bspwm
    ./rofi

    ./picom.nix
    ./dunst.nix
    ./polybar.nix
    #   ./screen-lock.nix
    ./xss-lock.nix
  ];
}
