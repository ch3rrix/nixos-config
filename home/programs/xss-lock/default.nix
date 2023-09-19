{
  config,
  pkgs,
  ...
}: {
  services.screen-locker = {
    enable = true;
    lockCmd = "/run/wrappers/bin/physlock";
    xss-lock.extraOptions = ["--ignore-sleep"];
  };
}
