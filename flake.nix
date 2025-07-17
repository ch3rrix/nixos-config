{
  description = "ch3rrix's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # home-manager
    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";
    flake-parts.url = "github:hercules-ci/flake-parts";
    ez-configs = {
      url = "github:ehllie/ez-configs";
      inputs.flake-parts.follows = "flake-parts";
    }; # ez-configs
    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # alejandra
    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin.url = "github:catppuccin/nix";
  }; # inputs

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      xenia = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/xenia
          ./modules/xenia.nix
          inputs.nixos-facter-modules.nixosModules.facter
          {config.facter.reportPath = ./facter.json;}

          {
            environment.systemPackages = [inputs.alejandra.defaultPackage.${system}];
          }

          inputs.catppuccin.nixosModules.catppuccin

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.ch3rrix = ./home;
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              backupFileExtension = "hm-backup";
            };
          } # home-manager
        ]; # modules
      }; # xenia
    }; # nixosConfigurations
  }; # outputs
}
