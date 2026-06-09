{ self, ... }:
{
  flake.modules.nixos.programs_throne = { pkgs, lib, ... }: {
    programs.throne = {
      enable = true;
      tunMode.setuid = true;
    };
  };
}
