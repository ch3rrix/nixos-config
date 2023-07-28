{ config, pkgs, ... }:
{
  xsession.windowManager.bspwm.monitors = {
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
  };
}
