{ config
, pkgs
, ...
}: {
  imports = [
    ./bspwm

    ../programs/rofi
    ../programs/picom
    ../programs/dunst
    ../programs/polybar
    #   ../screen-lock
    ../programs/xss-lock
  ];
}
