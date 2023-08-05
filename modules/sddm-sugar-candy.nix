{ config, pkgs, inputs, outputs, sddm-sugar-candy-nix, ... }:
let
  hostname = (config.networking.hostName);
  username = "ch3rrix";
in
{
  imports = [
    inputs.sddm-sugar-candy-nix.nixosModules.default
    {
      nixpkgs = {
        overlays = [ inputs.sddm-sugar-candy-nix.overlays.default ];
      };
    }
  ];

  services.xserver.displayManager.sddm.sugarCandyNix = {
    enable = true;

    settings = {
      ScreenWidth =
        if (config.networking.hostName == "laptop") then
          1366
        else if (config.networking.hostName == "workplace") then
          1920
        else
          { };
      ScreenHeight =
        if (config.networking.hostName == "laptop") then
          768
        else if (config.networking.hostName == "workplace") then
          1080
        else
          { };
      FormPosition = "left";
    };
  };
}
