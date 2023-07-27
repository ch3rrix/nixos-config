{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  services.printing.enable = true;
  networking.hostName = "workplace";


  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" =
      {
        device = "/dev/disk/by-label/ROOT";
        fsType = "ext4";
      };

    "/boot" =
      {
        device = "/dev/disk/by-label/BOOT";
        fsType = "vfat";
      };
  };

  swapDevices =
    [{ device = "/dev/disk/by-label/SWAP"; }];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}

