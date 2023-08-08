{ osConfig, ... }:
let hostname = osConfig.networking.hostName;
in {
  xsession.windowManager.bspwm = {
    enable = true;
    settings = {
      border_width = 2;
      gapless_monocle = true;
      split_ratio = 0.52;
      window_gap = 4;
      focus_follows_pointer = true;
      single_monocle = true;

      normal_border_color = "#313244";
      active_border_color = "#45475a";
      focused_border_color = "#f5c2e7";
      presel-feedback_colour = "#a6e3a1";
    };
    startupPrograms = [
      "xsetroot -cursor_name left_ptr"
      "polybar"
    ];
    monitors =
      if "${hostname}" == "laptop" then {
        eDP-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ];
      } else if "${hostname}" == "workplace" then {
        HDMI-1 = [ "I" "II" "III" ];
        DP-1 = [ "IV" "V" "VI" "VII" ];
      } else if "${hostname}" == "xenia" then
        {
          HDMI-0 = [ "I" "II" "III" "IV" "V" "VI" ];
          HDMI-1 = [ "VII" "VIII" "IX" "X" ];
        }
      else { };
  };
}
