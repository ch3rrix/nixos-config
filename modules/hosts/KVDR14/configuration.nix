{ self, ... }: {
  flake.nixosConfigurations = self.lib.mkNixos "KVDR14" { };

  flake.modules.nixos.host_KVDR14 = {
    imports = with self.modules.nixos; [
      wm_niri
    ];
  };
}
