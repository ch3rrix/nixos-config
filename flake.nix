{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    }; #flake-parts

    ez-configs = {
      url = "github:ehllie/ez-configs";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    }; #ez-configs

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # home-manager

    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # nh

    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };


    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";

  }; # inputs

  outputs = inputs@{ flake-parts, ez-configs, home-manager, nixvim, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ez-configs.flakeModule
        home-manager.flakeModules.home-manager
      ];

      systems = [ "x86_64-linux" ];

      perSystem = { pkgs, ... }: {
        formatter = pkgs.nixpkgs-fmt;
      };

      ezConfigs = {
        root = ./.;
        globalArgs = { inherit inputs; };
      };
    }; # outputs, flake-parts.lib.mkFlake
}
