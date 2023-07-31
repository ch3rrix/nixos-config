{ config, pks, lib, osConfig, ... }:
let hostname = osConfig.networking.hostName; in
{
  xsession.windowManager.bspwm = {
    enable = true;
    settings = {
      border_width = 2;
      gapless_monocle = true;
      split_ratio = 0.52;
      window_gap = 0;

      normal_border_color = "#7ccdfd";
      active_border_color = "#7ccdfd";
      focused_border_color = "#f5748c";
      presel-feedback_colour = "#fc9d63";


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
