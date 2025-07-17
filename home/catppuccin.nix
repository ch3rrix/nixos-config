{ pkgs, inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ]; # imports

  gtk = {
    enable = true;
  }; # gtk

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  }; # qt

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
    firefox.profiles.default.enable = true;
    hyprland.enable = true;
    gtk = {
      enable = true;
      flavor = "mocha";
      accent = "lavender";
      size = "compact";
      icon = {
        enable = true;
        accent = "lavender";
        flavor = "mocha";
      }; # icon
    }; # gtk
    kvantum = {
      enable = true;
      apply = true;
    }; # kvantum
    nvim = {
      enable = true;
      flavor = "mocha";
    }; # nvim
  };
}
