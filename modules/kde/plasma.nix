{ pkgs, ... }:
{
  imports = [
    ../xserver.nix
  ];
  services.xserver = {
    displayManager.sddm.enable = true;

    desktopManager.plasma5 = {
      enable = true;
      runUsingSystemd = true;
      phononBackend = "vlc";
    };
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    konsole
    plasma-browser-integration
    print-manager
    khelpcenter
  ];
}
