{ flake, pkgs, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.default
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
    ./configuration.nix
    (self + /modules/nixos/linux/gui/gnome.nix)
    (self + /modules/nixos/linux/gui/desktopish/fonts.nix)
  ];

  services.openssh.enable = false;
  programs.nix-ld.enable = true; # for vscode server

  environment.systemPackages = with pkgs; [
  ];

  # Workaround the annoying `Failed to start Network Manager Wait Online` error on switch.
  # https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = false;
}
