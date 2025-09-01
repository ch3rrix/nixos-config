{
  inputs,
  pkgs,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --cmd 'uwsm start default'";
      }; # default session
    }; # settings
  }; # services.greetd
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
  }; # programs.hyprland

  environment.systemPackages = [
    pkgs.wofi
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.waybar
    pkgs.hyprshot
  ]; # environment.systemPackages
}
