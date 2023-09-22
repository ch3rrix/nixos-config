{
  description = "ch3rrix's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    #alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    #alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, nixvim, sddm-sugar-candy-nix, nix-colors, ... }@inputs:
    with inputs.self.lib;
    let
      system = "x86_64-linux";
      dir = with lib; (x: y: map (path: x + lib.substring (lib.stringLength (toString ./.)) (-1) (toString path)) y);
    in
    {
      #formatter."${system}" = nixpkgs.legacyPackages."${system}".alejandra;
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit self inputs nix-colors; };
          modules = [
            ./modules/common.nix
            ./modules/xserver.nix
            ./modules/tablet.nix
            ./modules/home-manager.nix
            ./modules/pipewire.nix
            ./modules/fish.nix
            ./modules/xdg.nix
            ./modules/physlock.nix
            ./modules/env-vars.nix
            ./modules/fonts.nix
            ./modules/adb.nix
            ./modules/sddm-sugar-candy.nix

            ./hosts/laptop.nix
          ];
        };
        workplace = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit self inputs nix-colors; };
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
            ./modules/sddm-sugar-candy.nix
            ./modules/awesome.nix
            ./modules/sway.nix
	    ./modules/adb.nix
            #./modules/kde
            #./modules/plasma.nix


            ./modules/zram.nix
            ./hosts/workplace.nix
          ];
        };

        xenia = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit self inputs nix-colors; };
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
            ./modules/sddm-sugar-candy.nix
            ./modules/tablet.nix
            #./modules/opentabletdriver.nix

            ./hosts/xenia.nix
          ];
        };
      };
    };
}
