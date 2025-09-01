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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # nixvim

    hyprland.url = "github:hyprwm/Hyprland";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # stylix

    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # apple-fonts
  }; # inputs

  outputs = inputs: let
    inherit (inputs.nixpkgs) lib;
    system = "x86_64-linux";

    specialArgs = {
      inherit inputs;
    }; # specialArgs

    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    }; # pkgs
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
          inputs.stylix.nixosModules.stylix

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.ch3rrix = ./home;
              backupFileExtension = ".hm-bk";
              extraSpecialArgs = specialArgs;
            }; # home-manager
          }
        ]; # modules
      }; # xenia
    }; # nixosConfigurations
  }; # outputs
}
