{ pkgs, ... }:
{
  imports = [
    ./packages
#   ./neovim
    ./nixvim
    ./vscode
    ./wm
    ./alacritty
    ./firefox
    ./git
    ./eww
    ./theme/catppuccin
    ./java
    ./emacs
  ];

  home = {
    username = "ch3rrix";
    homeDirectory = "/home/ch3rrix";
    stateVersion = "23.05";
  };
}
