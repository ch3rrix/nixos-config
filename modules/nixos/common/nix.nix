{ inputs, ... }: {
  flake.modules.nixos.common =
    { config, lib, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
      imports = [ inputs.nix-index-database.nixosModules.default ];

      programs = {
        nix-index-database.comma.enable = true;
        command-not-found.enable = lib.mkForce false;

        nh = {
          enable = true;
          flake = "/home/${user}/nixos-config";
          clean = {
            enable = true;
            dates = "daily";
            extraArgs = "--keep-since 7d --optimise";
          };
        };

        nix-ld.enable = true;
      };

      documentation.nixos.enable = false;

      nixpkgs.config.allowUnfree = true;

      nix = {
        channel.enable = false;
        settings = {
          experimental-features = [
            "flakes"
            "nix-command"
          ];

          trusted-users = [
            "root"
            "@wheel"
          ];

          extra-substituters = [ ];

          extra-trusted-public-keys = [ ];
        };
      };
    };
}
