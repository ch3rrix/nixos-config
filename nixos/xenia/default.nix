{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ]; # imports

  boot = {
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci_renesas" "xhci_pci" "usb_storage" "sd_mod" "sdhci_pci"];
      kernelModules = [];
    }; # initrd

    kernelModules = ["kvm-amd"];
    extraModulePackages = [];

    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  }; # boot

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/b8d43b35-a88b-4ee1-a489-88fe2a46d429";
      fsType = "ext4";
    }; # "/"

    "/boot" = {
      device = "/dev/disk/by-uuid/7E68-72AF";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    }; # "/boot"
  }; # fileSystems

  networking = {
    hostName = "xenia";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  }; # networking

  users.users.ch3rrix = {
    isNormalUser = true;
    description = "Ruslan Rakshinsky";
    extraGroups = ["networkmanager" "wheel" "video"];
  }; # users.users.ch3rrix

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  }; # hardware

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    }; # gnupg.agent
  }; # programs

  system.stateVersion = "25.05";
}
