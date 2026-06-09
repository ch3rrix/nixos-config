{
  flake.modules.nixos.programs_obsidian =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.obsidian
      ];
    };
}
