{ config, pkgs, ... }:
let username = "ch3rrix"; in
{
  programs.adb.enable = true;
  users.users.${username}.extraGroups = [ "adbusers" ];

  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}

