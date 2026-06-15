{ inputs, ... }: {
  flake.modules.nixos.wm = {
    imports = [ inputs.monique.nixosModules.default ];

    programs.monique.enable = true;
  };
}
