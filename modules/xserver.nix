{ pkgs
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
      }; /* libinput */
    }; /* xserver */
  }; /* services */
}
