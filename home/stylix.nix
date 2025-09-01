{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.stylix.homeModules.stylix
  ]; # imports

  dconf.settings."org/gnome/desktop/interface".color-scheme = lib.mkForce "prefer-dark";
  gtk.gtk3.extraConfig.gtk-application-prefer-dark-theme = true;

  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/valua.yaml";
    image = ./hyprland/wallpaper.png;
    polarity = "dark";
    autoEnable = true;
    targets = {
      firefox = {
        enable = false;
      };
    }; # targets
    fonts = {
      serif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      }; # serif
    }; # fonts
  }; # stylix
}
