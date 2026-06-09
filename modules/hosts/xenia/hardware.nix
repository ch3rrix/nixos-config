{
  flake.modules.nixos.host_xenia =
    { config, lib, ... }:
    let
      inherit (config.custom.constants) system;
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
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableAllFirmware;
    };
}
