{self, inputs,...}:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.eza = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.eza;
        flags = {
          "--icons" = true;
          "--group-directories-first" = true;
          "--hyperlink" = true;
          "--no-user" = true;
          "--time-style" = "+%Y-%m-%d %H:%M";
        };
      };
    };

  flake.modules.nixos.common =
    { config, lib, pkgs, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
      environment = {
        systemPackages = with pkgs; [
          self.packages.${pkgs.stdenv.hostPlatform.system}.eza
          ripgrep
          unzip
          zip
          fzf
        ];
        shellAliases = {
          ls = "eza";
          ll = "eza -l";
          la = "eza -a";
          lla = "eza -la";
          lt = "eza --tree";
        };
      };

      programs =
        let
          exe = lib.getExe pkgs.fzf;
        in
        {
          yazi = {
            enable = true;
          };
          fish = {
            enable = true;
            interactiveShellInit = ''
              set fish_greeting
              ${exe} --fish | source
            '';
          };
        };

      users.users.${user}.shell = pkgs.fish;
    };
}
