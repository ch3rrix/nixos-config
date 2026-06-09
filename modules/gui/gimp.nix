{
  flake.modules.nixos.programs_gimp =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.gimp
      ];
    };
}
