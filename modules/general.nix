{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: {
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  }; # boot

  nixpkgs = {
    flake.setFlakeRegistry = true;
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "x86_64-linux";
  }; # nixpkgs

  environment.systemPackages = [pkgs.nil]; # environment.systemPackages

  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "en_US.UTF-8";
  }; # i18n

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  }; # console

  services.xserver = {
    xkb = {
      layout = "us,ru";
      options = "grp:caps_toggle";
    }; # xkb
  }; # services.xserver

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
      trusted-users = ["@wheel"];
      substituters = ["https://nix-community.cachix.org" "https://hyprland.cachix.org"];
      trusted-substituters = ["https://nix-community.cachix.org" "https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
      extra-substituters = ["https://nix-community.cachix.org"];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      auto-optimise-store = true;
      allowed-users = ["@wheel"];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    }; # settings
    registry.n.flake = inputs.nixpkgs;
  }; # nix

  security = {
    rtkit.enable = true;
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
    }; # security.sudo
    polkit.enable = true;
  }; # security

  system.stateVersion = "25.11"; # Did you read the comment?
}
