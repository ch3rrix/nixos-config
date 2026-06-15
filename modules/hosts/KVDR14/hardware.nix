{
  flake.modules.nixos.host_KVDR14 =
    { config, lib, ... }:
    let
      inherit (config.custom.constants) system;
      facterPath = ./facter.json;
      hasFacter = builtins.pathExists facterPath;
    in
    {

      boot = {
        initrd = {
          availableKernelModules = [
            "xhci_pci"
            "ahci"
            "nvme"
            "usbhid"
            "usb_storage"
          ];
          kernelModules = [ ];
        };
        kernelModules = [ "kvm-intel" ];
        extraModulePackages = [ ];
      };

      nixpkgs.hostPlatform = lib.mkDefault system;
      hardware.enableAllFirmware = true;
      hardware.facter.reportPath = lib.mkIf hasFacter facterPath;
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
