{ config, pkgs, inputs, ... }:
let
  hostname = config.networking.hostName;
  username = "ch3rrix";
  hm = inputs.home-manager.nixosModules.home-manager;
in
{
  imports = [
#   (import "${home-manager}/nixos")
    hm 
   #{
   #  home-manager.useGlobalPkgs = true;
   #  home-manager.useUserPackages = true;
   #  home-manager.users.${username} = import ./home/${hostname}.nix;
   #}
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users."${username}" = {
      import = ../home/${hostname}.nix;
    };
    home.stateVersion = config.system.stateVersion;
  };
}
