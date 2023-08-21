{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bspwm

    ./picom.nix
    ./dunst.nix
    ./rofi.nix
    ./polybar.nix
    #   ./screen-lock.nix
    ./xss-lock.nix
  ];
}
