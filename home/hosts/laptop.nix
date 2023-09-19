{ pkgs, ... }: {
  imports = [
    ../programs/packages
    #../programs/neovim
    ../programs/nixvim
    ../programs/vscode
    ../programs/wm
    ../programs/alacritty
    ../programs/firefox
    ../programs/git
    ../programs/theme/catppuccin
    ../programs/java
    ../programs/emacs
    ../programs/fonts
    ../programs/gaming
  ];

  home = {
    username = "ch3rrix";
    homeDirectory = "/home/ch3rrix";
    stateVersion = "23.05";
  };
}
