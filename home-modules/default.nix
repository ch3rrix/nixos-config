{ ezModules, lib, inputs, ... }:
{
  imports = lib.attrValues
    {
      inherit (ezModules)
        # alacritty
        git
        # hyprland
        kitty
        neovim
        obs-studio
        packages
        ;
    };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
