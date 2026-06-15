{
  flake.modules.nixos.programs_graphics = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.blender ];
  };
}
