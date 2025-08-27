{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # home-manager

    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # nix-index-database

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # nvf

    hyprland.url = "github:hyprwm/Hyprland";
  }; # inputs

  outputs = inputs: let
    specialArgs = {
      inherit inputs;
    }; # specialArgs
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    }; # pkgs
    lib = inputs.nixpkgs.lib;
  in {
    formatter.${system} = pkgs.alejandra;
    # In flake.nix
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        nil
        alejandra
        statix
        deadnix
      ]; # buildInputs
    }; # devShells
    nixosConfigurations = {
      xenia = lib.nixosSystem {
        inherit system specialArgs;
        modules = [
          ./nixos/xenia

          inputs.nixos-facter-modules.nixosModules.facter
          {config.facter.reportPath = ./nixos/xenia/facter.json;}

          inputs.nix-index-database.nixosModules.nix-index

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ch3rrix = ./home;
            home-manager.extraSpecialArgs = specialArgs;
          } # home-manager
        ]; # modules
      }; # xenia
    }; # nixosConfigurations
  }; # outputs
}
