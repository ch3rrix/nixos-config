{ pkgs, ... }: {
  imports = [
    ./packages
    #   ./neovim
    ./nixvim
    ./vscode
    ./wm/bspwm.nix
    ./alacritty
    ./firefox
    ./git
    ./theme/catppuccin
    ./java
    ./emacs
    ./fonts
    ./fish
  ];

  home = {
    username = "ch3rrix";
    homeDirectory = "/home/ch3rrix";
    stateVersion = "23.05";
  };
}
