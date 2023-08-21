{
  config,
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "xfs";
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };

  swapDevices = [{device = "/dev/disk/by-label/swap";}];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "sd_mod"];
    initrd.kernelModules = [];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
  };

  networking = {
    hostName = "laptop"; # Define your hostname.
    networkmanager.enable =
      true; # Easiest to use and most distros use this by default.
    useDHCP = lib.mkDefault true;
  };

  environment.systemPackages = with pkgs; [vim wget git];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "23.05"; # Did you read the comment?
}
