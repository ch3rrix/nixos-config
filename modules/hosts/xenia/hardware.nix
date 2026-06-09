{
  flake.modules.nixos.host_xenia =
    { config, lib, ... }:
    let
      inherit (config.custom.constants) system;
      facterPath = ./facter.json;
      hasFacter = builtins.pathExists facterPath;
    in
    {
      boot = {
        initrd.availableKernelModules = [
          "xhci_pci"
          "thunderbolt"
          "vmd"
          "nvme"
          "usb_storage"
          "sd_mod"
        ];
        initrd.kernelModules = [ ];
        kernelModules = [ "kvm-amd" ];
        extraModulePackages = [ ];
      };

      nixpkgs.hostPlatform = lib.mkDefault system;

      hardware.enableAllFirmware = true;
      hardware.facter.reportPath = lib.mkIf hasFacter facterPath;
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableAllFirmware;
    };
}
