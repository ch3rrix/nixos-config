{
  flake.modules.nixos.programs_blender = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.blender ];
  };
}
