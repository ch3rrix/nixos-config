{
  flake.modules.nixos.programs_telegram = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.telegram-desktop ];
  };
}
