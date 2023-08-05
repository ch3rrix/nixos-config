{ config, pkgs, ... }: {
  services.screen-locker.xautolock = {
    enable = true;
    detectSleep = true;
  };

  services.betterlockscreen = {
    enable = true;
    inactiveInterval = 10;
  };

}
