{
  pkgs,
  lib,
  ...
}: {
  nix = {
    channel.enable = false;

    gc = {
      automatic = true;
      dates = "weekly";
      persistent = true;
    }; # gc

    optimise = {
      automatic = true;
      dates = "weekly";
      persistent = true;
    }; # optimise

    settings = {
      trusted-users = ["@wheel"];
      trusted-substituters = ["https://hydra.nixos.org/"];
      auto-optimise-store = true;
      allowed-users = ["@wheel"];
      experimental-features = ["nix-command" "flakes"];
    }; # settings
    registry = {
      nixpkgs.to = {
        type = "path";
        path = pkgs.path;
        narHash =
          builtins.readFile
          (pkgs.runCommandLocal "get-nixpkgs-hash"
            {nativeBuildInputs = [pkgs.nix];}
            "nix-hash --type sha256 --sri ${pkgs.path} > $out");
      }; # nixpkgs.to
    }; # registry
  }; # nix

  environment.systemPackages = [pkgs.nil]; # environment.systemPackages

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "x86_64-linux";
  }; # nixpkgs
}
