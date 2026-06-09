{
  flake.modules.nixos.common =
    { pkgs, lib, ... }:
    {
      programs.yazi = {
        enable = true;
      };
    };
}
