{ config, pkgs, home-manager, ... }:
let
  hostname = config.networking.hostName;
  username = "ch3rrix";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username} = {
      import = ./home/${hostname}.nix;
      home.stateVersion = "23.05";
    };
  };
}
