{
  description = "ch3rrix's NixOS configuration";

  nixConfig = {
    extra-experimental-features = "nix-command flakes";
    extra-substituters = "https://trilby.cachix.org";
    extra-trusted-public-keys = "trilby.cachix.org-1:47uj9Bdgk9jCfhnY7ZDJlRSNJ/y5RkU6wBaEmGn9uns=";
  };

  inputs = {
    "nixpkgs-22.11".url = "github:nixos/nixpkgs/nixos-22.11";
    "nixpkgs-23.05".url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    trilby.url = "github:ners/trilby";

    nix-filter.url = "github:numtide/nix-filter";

    nix-monitored = {
      url = "github:ners/nix-monitored";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.nix-filter.follows = "nix-filter";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nixvim.url = "github:nix-community/nixvim";

   #sddm-sugar-candy-nix = {
   #  url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
   #  inputs.nixpkgs.follows = "nixpkgs-unstable";
   #};
  }; /* inputs */

  outputs = inputs:
    with builtins;
    let
      buildPlatforms = attrNames inputs.nixpkgs-unstable.legacyPackages;
    in
    {
      formatter."${system}" = nixpkgs.legacyPackages."${system}".nixpkgs-fmt;
      nixosConfigurations = {
        laptop = inputs.trilby.lib.trilbySystem {
          inherit system;
          specialArgs = { inherit self inputs; };
          modules = [
            ./modules/common.nix
            ./modules/xserver.nix
            ./modules/tablet.nix
            ./modules/common.nix
            ./modules/xserver.nix
            ./modules/home-manager.nix
            ./modules/pipewire.nix
            ./modules/fish.nix
            ./modules/xdg.nix
            ./modules/physlock.nix
            ./modules/env-vars.nix
            ./modules/fonts.nix
            ./modules/adb.nix
            #./modules/sddm-sugar-candy.nix

            ./hosts/laptop.nix
          ];
        };
        workplace = inputs.trilby.lib.trilbySystem {
          inherit system;
          specialArgs = { inherit self inputs; };
          modules = [
            ./modules/common.nix
            ./modules/xserver.nix
            ./modules/home-manager.nix
            ./modules/pipewire.nix
            ./modules/fish.nix
            ./modules/xdg.nix
            ./modules/physlock.nix
            ./modules/env-vars.nix
            ./hosts/workplace.nix
            ./modules/fonts.nix
	    #./modules/sddm-sugar-candy.nix

            ./hosts/workplace.nix
          ];
        };

        xenia = inputs.trilby.lib.trilbySystem {
          inherit system;
          specialArgs = { inherit self inputs; };
          modules = [
            ./modules/common.nix
            ./modules/xserver.nix
            ./modules/home-manager.nix
            ./modules/pipewire.nix
            ./modules/fish.nix
            ./modules/xdg.nix
            ./modules/physlock.nix
            ./modules/env-vars.nix
            ./modules/fonts.nix
            ./modules/adb.nix
            #./modules/sddm-sugar-candy.nix
            ./modules/tablet.nix
	    #./modules/opentabletdriver.nix

            ./hosts/xenia.nix
          ];
        };
      };
    };
}
