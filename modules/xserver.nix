{
  config,
  pkgs,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      layout = "us,ru";
      xkbOptions = "grp:caps_toggle";
      excludePackages = [pkgs.xterm];
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
      displayManager = {
        defaultSession = "none+bspwm";
        sddm.enable = true;
      };
    };
  };
}
