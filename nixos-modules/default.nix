{ inputs, lib, modulesPath, pkgs, ... }:
let
  inherit (lib) attrValues;

in
{
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  nix = {
    channel.enable = false;

    gc = {
      automatic = true;
      dates = "weekly";
      persistent = true;
    }; # gc

    optimise = {
      automatic = true;
      dates = "weekly";
      persistent = true;
    }; # optimise

    settings = {
      trusted-users = [ "@wheel" ];
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-substituters = [ "https://nix-community.cachix.org" ];
      extra-substituters = [ "https://nix-community.cachix.org" ];
      extra-trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
      auto-optimise-store = true;
      allowed-users = [ "@wheel" ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    }; # settings
    registry.n.flake = inputs.nixpkgs;
  }; # nix

  environment.systemPackages = [ pkgs.nil ]; # environment.systemPackages

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "x86_64-linux";
  }; # nixpkgs

  networking = {
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  }; # networking

  security = {
    rtkit.enable = true;
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
    }; # security.sudo
  }; # security

  users.users.ch3rrix = {
    isNormalUser = true;
    description = "Ruslan Rakshinsky";
    extraGroups = [ "networkmanager" "wheel" "video" "adbusers" ];
  }; # users.users.ch3rrix

  system = {
    stateVersion = "25.11";
  }; # system

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  }; # boot

}
