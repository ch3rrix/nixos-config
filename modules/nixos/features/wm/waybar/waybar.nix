{ self, inputs, ... }:
{
  perSystem = { pkgs, ... }: {
    packages.waybar = inputs.wrappers.wrappers.waybar.wrap {
      inherit pkgs;
      package = pkgs.waybar;
      settings = import ./_settings.nix { inherit self; };
    };
  };

  flake.modules.nixos.wm =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      waybar' = self.packages.${pkgs.stdenv.hostPlatform.system}.waybar.wrap {
        settings.content = import ./_settings.nix { inherit self; };
        "style.css".content = import ./_style.nix { inherit self; };
      };
    in
    {
      programs.waybar = {
        enable = true;
        package = waybar';
      };
    };
}
