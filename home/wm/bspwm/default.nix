{ config, pkgs, ... }:
{
  imports = [
    ./bspwm.nix
    ./sxhkd.nix
    ./workplace.nix
  ];
}
