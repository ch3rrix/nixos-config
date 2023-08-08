{ config, pkgs, ... }:
{
  home.pachages = with pkgs; [
    krita
  ];
}
