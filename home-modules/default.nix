{ ezModules, lib, ... }:
{
  imports = lib.attrValues {
    inherit (ezModules)
      # alacritty
      git
      # hyprland
      kitty
      nixvim
      obs-studio
      packages
      ;
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
