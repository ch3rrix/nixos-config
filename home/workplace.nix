{ pkgs, ... }:
{
  imports = [
    ./packages
    ./neovim
    ./vscode
    ./bspwm
    ./alacritty
    ./firefox
    ./git
  ];

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


  home = {
    username = "ch3rrix";
    homeDirectory = "/home/ch3rrix";
    stateVersion = "23.05";
  };
}
