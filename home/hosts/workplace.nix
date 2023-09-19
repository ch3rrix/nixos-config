{ pkgs
, lib
, ...
}:

let
  concat = with lib; (x: y: map (path: x + lib.substring (lib.stringLength (toString ./.)) (-1) (toString path)) y);

  programs = concat ../programs [
    /* Imagine we're in /etc/nixos/home/programs */
    ./.
    ./nixvim
    ./vscode
    ./alacritty
    ./firefox
    ./git
    ./java
    ./emacs
    ./fish
  ];

  configs = concat ../conf [
    /* Imagine we're in /etc/nixos/home/conf */
    ./fonts
    ./themes/catppuccin
  ];

in
{


  imports = [
    ../wm/bspwm.nix
  ] ++ programs ++ configs;

  home = {
    username = "ch3rrix";
    homeDirectory = "/home/ch3rrix";
    stateVersion = "23.05";
  };
}
