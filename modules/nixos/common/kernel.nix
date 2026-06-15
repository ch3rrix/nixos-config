_: {
  flake.modules.nixos.common = { pkgs, ... }: {
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
