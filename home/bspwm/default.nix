{ config, pks, ... }:
{
  imports = [
    ./sxhkd.nix
    ./rofi.nix
    ./polybar.nix
    ./screen-lock.nix
    ./dunst.nix
  ];
  xsession.windowManager.bspwm = {
    enable = true;
    settings = {
      border_width = 2;
      gapless_monocle = true;
      split_ratio = 0.52;
      window_gap = 0;
    };
    startupPrograms = [
      "xsetroot -cursor_name left_ptr"
    ];
    monitors = {
      eDP-1 = [
        "I"
        "II"
        "III"
        "IV"
        "V"
        "VI"
        "VII"
        "VIII"
        "IX"
        "X"
      ];
    };
  };
}
