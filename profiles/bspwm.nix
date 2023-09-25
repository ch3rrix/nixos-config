{
  imports = [
    ../modules/bspwm.nix
    ../modules/physlock.nix
    ../modules/sddm-sugar-candy.nix
    ../modules/sddm.nix
    ../modules/xdg.nix
    ../modules/xserver.nix
  ];

  displayManager.defaultSession = "none+bspwm";
  services.xserver.windowManager.bspwm.enable = true;
}
