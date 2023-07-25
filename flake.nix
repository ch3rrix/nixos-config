{
  description = "ch3rrix's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./modules/common.nix
          ./hosts/laptop.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ch3rrix = import ./home/laptop.nix;
	  }
        ];
      };
      workplace = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./modules/common.nix
          ./hosts/workplace.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ch3rrix = import ./home/workplace.nix;
	  }
        ];
      };
    };
  };
}
