{ config, pkgs, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  networking = {
    hostName = "xenia";
  };

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    }; # initrd
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  }; # boot

  fileSystems = {
    "/" =
      {
        device = "/dev/disk/by-label/nixos";
        fsType = "ext4";
      }; # /
    "/boot" =
      {
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
      }; # /boot
  }; # fileSystems

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      nvidiaSettings = true;
    }; # nvidia
  }; # hardware

  services.xserver.videoDrivers = [ "nvidia" ];
}

