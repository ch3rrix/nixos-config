{ pkgs, ... }:
{
  imports = [
    ./packages
    ./neovim
    ./bspwm
    ./alacritty
    ./firefox
    ./git
  ];



  home = {
    username = "ch3rrix";
    homeDirectory = "/home/ch3rrix";
    stateVersion = "23.05";
  };
}
