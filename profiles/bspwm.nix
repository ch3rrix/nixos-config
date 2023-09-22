{
  imports = [
    ../modules/common.nix
    ../modules/xserver.nix
    ../modules/tablet.nix
    ../modules/home-manager.nix
    ../modules/pipewire.nix
    ../modules/fish.nix
    ../modules/xdg.nix
    ../modules/physlock.nix
    ../modules/env-vars.nix
    ../modules/fonts.nix
    ../modules/adb.nix
    ../modules/sddm-sugar-candy.nix

    ./hosts/laptop.nix
  ];
}
