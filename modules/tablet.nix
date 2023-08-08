{ config, pkgs, osConfig, ... }:
{
  services.xserver = {
    #wacom.enable = true;
    digimend.enable = true;
  };
}
