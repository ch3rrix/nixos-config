{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    pavucontrol
    libnotify
    hunspell
    hunspellDicts.ru_RU
    libreoffice-qt
    bat
    jq
    dconf
    nixpkgs-fmt
    flameshot
    xclip
    ksnip
    cloc
  ];
}
