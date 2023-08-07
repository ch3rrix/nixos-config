{ pkgs, ... }: {
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
    ./fonts
    ./lw-test/librewolf.nix
  ];

  programs.librewolf1 = {
    enable = true;
  };

  home = {
    username = "ch3rrix";
    homeDirectory = "/home/ch3rrix";
    stateVersion = "23.05";
  };
}
