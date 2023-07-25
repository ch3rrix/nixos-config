{
  description = "ch3rrix's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
  system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
	specialArgs = { inherit self inputs; };
        modules = [
	  ./modules/common.nix
          ./hosts/laptop.nix
        ];
      };
      workplace = nixpkgs.lib.nixosSystem {
        inherit system;
	specialArgs = { inherit self inputs; };
        modules = [
	 ./modules/common.nix
         ./hosts/workplace.nix
	 ./modules/home-manager.nix
        ];
      };
    };
  };
}
