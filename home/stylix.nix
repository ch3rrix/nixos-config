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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    autoEnable = true;
    targets = {
      firefox = {
        enable = false;
      };
    };
  }; # stylix
}
