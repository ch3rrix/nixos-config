{ self, ... }: {
  flake.nixosConfigurations = self.lib.mkNixos "xenia" { };

  flake.modules.nixos.host_xenia = {
    imports = with self.modules.nixos; [
      wm_niri
      games
      hardware_battery
      hardware_bluetooth
    ];
  };
}
