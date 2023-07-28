{ config, pks, lib, ... }:
let hostname = config.networking.hostName; in
{
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
    monitors =
      if "${hostname}" == "laptop" then
        {
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
        }
      else if "${hostname}" == "workplace" then
        {
          HDMI-1 = [
            "I"
            "II"
            "III"
          ];
          DP-1 = [
            "IV"
            "V"
            "VI"
            "VII"
          ];
        } else { };
  };
}
