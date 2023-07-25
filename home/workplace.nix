{ pkgs, ... }:
{
  imports = [
    ./neovim
    ./bspwm
    ./alacritty
    ./firefox
  ];

  

  home = {
    username = "ch3rrix";
    homeDirectory = "/home/ch3rrix";
    stateVersion = "23.05";
    packages = with pkgs; [
      telegram-desktop
    ];
  };
}
