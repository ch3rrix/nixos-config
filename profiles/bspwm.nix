{
  imports = [
    ../modules/physlock.nix
    ../modules/sddm-sugar-candy.nix
    ../modules/sddm.nix
    ../modules/xdg.nix
    ../modules/xserver.nix
  ];

  services.xserver.displayManager.defaultSession = "none+bspwm";
  services.xserver.windowManager.bspwm.enable = true;
}
