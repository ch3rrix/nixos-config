{ config, pkgs, inputs, outputs, ... }:
let
  hostname = (config.networking.hostName);
  username = "ch3rrix";
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = import ../home/${hostname}.nix;
    }
  ];
}
