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
      device = "/dev/disk/by-uuid/c9cee5db-b0fd-486c-9891-ae61132be6d0";
      fsType = "ext4";
    }; # "/"

    "/boot" = {
      device = "/dev/disk/by-uuid/2DEE-E984";
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
