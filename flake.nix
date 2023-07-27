{
  description = "ch3rrix's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, catppuccin, ... }:
    let
      system = "x86_64-linux";
    in
    {
      formatter."${system}" = nixpkgs.legacyPackages."${system}".nixpkgs-fmt;
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit self inputs; };
          modules = [
            ./modules/common.nix
            ./modules/xserver.nix
            ./hosts/laptop.nix
          ];
        };
        workplace = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit self inputs; };
          modules = [
            ./modules/common.nix
            ./modules/xserver.nix
            ./modules/home-manager.nix
            ./modules/pipewire.nix
            ./modules/catppuccin.nix
            ./hosts/workplace.nix
          ];
        };
      };
    };
}
