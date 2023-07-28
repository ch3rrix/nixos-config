{ config, pkgs, ... }:
{
  services.physlock = {
      enable = true;
      allowAnyUser = true;
      disableSysRq = true;
      # lockMessage = "some text here";
      lockOn = {
        hibernate = true;
        suspend = true;
      };
    };
}
