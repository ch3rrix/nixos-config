{ config, pkgs, inputs, outputs, ... }:
let
  hostname = (config.networking.hostName);
  username = "ch3rrix";
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${username} = import (../home/${hostname}.nix);
        extraSpecialArgs = {
          hostName = hostname;
        };
      };
    }
  ];
}
