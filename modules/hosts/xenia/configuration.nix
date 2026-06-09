{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos "xenia" { };

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
