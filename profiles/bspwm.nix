{
  imports = [
    ../modules/common.nix
    ../modules/xserver.nix
    ../modules/xdg.nix
    ../modules/physlock.nix

    ./hosts/laptop.nix
  ];
}
