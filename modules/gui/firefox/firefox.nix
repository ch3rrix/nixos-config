{ self, ... }:
{
  flake.modules.nixos.programs_firefox = { pkgs, lib, ... }: {
    programs.firefox = {
      enable = true;
      languagePacks = [ "ru" ];
    };
  };
}
