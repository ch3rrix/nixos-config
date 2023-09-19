{ config
, pkgs
, ...
}: {
  services = {
    xserver = {
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
      desktopManager.plasma5 = {
        enable = true;
        runUsingSystemd = true;
        phononBackend = "vlc";
      };
      displayManager.sddm = {
        enable = true;
      };
    };
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    plasma-browser-integration
    print-manager
    khelpcenter
  ];
}
