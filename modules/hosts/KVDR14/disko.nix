{ inputs, ... }: {
  flake.modules.nixos.host_KVDR14 = {
    imports = [ inputs.disko.nixosModules.disko ];

    disko.devices = {
      disk = {
        main = {
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                label = "boot";
                name = "ESP";
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                }; # content
              }; # partitions.ESP
              root = {
                label = "root";
                size = "100%";
                content = {
                  type = "filesystem";
                  format = "xfs";
                  mountpoint = "/";
                  mountOptions = [
                    "defaults"
                    "pquota"
                    "noatime"
                    "discard"
                  ];
                };
              };
            };
          };
        };
      };
    };
  };
}
