{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    pavucontrol
    libnotify
  ];
}
