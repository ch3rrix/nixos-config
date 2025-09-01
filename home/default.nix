{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "ch3rrix";
    stateVersion = "25.11";
    homeDirectory = "/home/ch3rrix";
  }; # home

  programs.git = {
    enable = true;
    userName = "Ruslan Rakshinsky";
    userEmail = "ch3rrix@proton.me";
  }; # programs.git

  imports = [
    ./hyprland
    ./emacs
    ./kitty.nix
    ./nixvim.nix
    ./obs-studio.nix
    ./packages.nix
    ./stylix.nix
  ]; # imports
}
