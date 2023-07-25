{ config, lib, pkgs, modulesPath, ... }:

{
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


  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
      ./common.nix
    ];

  networking = {
    hostName = "workplace"; # Define your hostname.
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    useDHCP = lib.mkDefault true;
  };

  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
  ];

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
      { device = "/dev/disk/by-label/ROOT";
        fsType = "ext4";
      };

    "/boot" =
      { device = "/dev/disk/by-label/BOOT";
        fsType = "vfat";
      };
  };

  swapDevices =
    [ { device = "/dev/disk/by-label/SWAP"; } ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  system.stateVersion = "23.05"; # Did you read the comment?
}

