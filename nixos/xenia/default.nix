{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    ../../modules/xenia.nix
    (modulesPath + "/installer/scan/not-detected.nix")
  ]; # imports

  boot = {
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];

    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci_renesas"
        "xhci_pci"
        "sdhci_pci"
      ];
      kernelModules = [];
    }; # initrd
  }; # boot

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "xfs";
    }; # "/"

    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    }; # "/boot"
  }; # fileSystems

  swapDevices = [];
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  networking = {
    hostName = "xenia";
    networkmanager.enable = true;
    useNetworkd = false;
    useDHCP = lib.mkDefault true;
  }; # networking

  services = {
    # printing.enable = true;
    # openssh.enable = true;
    libinput.enable = true;
  }; # services

  users.users.ch3rrix = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "networkmanager"
      "adbusers"
    ];
    packages = with pkgs; [
      vim
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  programs = {
    mtr.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    }; # gnupg.agent
  }; # programs
}
