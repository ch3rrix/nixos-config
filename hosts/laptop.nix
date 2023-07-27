# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).
{ config, pkgs, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  fileSystems = {
    "/" =
      {
        device = "/dev/disk/by-label/root";
        fsType = "xfs";
      };

    "/boot" =
      {
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
      };
  };

  swapDevices =
    [{ device = "/dev/disk/by-label/swap"; }];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };


  networking = {
    hostName = "laptop"; # Define your hostname.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    useDHCP = lib.mkDefault true;
  };

  time.timeZone = "Europe/Moscow";


  services = {
    xserver = {
      enable = true;
      layout = "us,ru";
      xkbOptions = "grp:caps_toggle";
      libinput.enable = true;
      windowManager.bspwm.enable = true;
      displayManager = {
        defaultSession = "none+bspwm";
        lightdm.enable = true;
      };
    };
  };

  system.stateVersion = "23.05"; # Did you read the comment?
}

