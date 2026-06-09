{ self, lib, ... }:
let
  facterPath = ./facter.json;
  hasFacter = builtins.pathExists facterPath;
in
{
  flake.nixosConfigurations = self.lib.mkNixos "xenia" { };

  hardware.facter.reportPath = lib.mkIf hasFacter facterPath;

  flake.modules.nixos.host_xenia = {
    imports = with self.modules.nixos; [
      wm_niri

      games
      programs_nautilus
      programs_kitty
      programs_firefox
      programs_throne
      programs_thunderbird
      programs_obsidian

      hardware_battery
      hardware_bluetooth
    ];
  };
}
