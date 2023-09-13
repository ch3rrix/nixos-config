{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    layout = "us,ru";
    xkbOptions = "grp:caps_toggle";
    excludePackages = [ pkgs.xterm ];
    libinput = {
      enable = true;
      mouse = {
        accelSpeed = "-0.5";
        accelProfile = "flat";
      };
    };
    windowManager = {
      bspwm.enable = true;
    };
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
