{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Pink-date";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
  };
}
