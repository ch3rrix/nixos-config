{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    krita
    mypaint
    mypaint-brushes
    mypaint-brushes1
  ];
}
