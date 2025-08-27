{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ]; # imports

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        vimAlias = true;
        viAlias = true;
        withPython3 = true;
        withRuby = true;
        withNodeJs = true;

        languages = {
          nix = {
            enable = true;
            extraDiagnostics.enable = true;
            format = {
              enable = true;
              package = pkgs.alejandra;
            }; # nix.format

            lsp = {
              enable = true;
              package = pkgs.nil;
              server = "nil";
            }; # lsp
          }; # nix
        }; # languages
      }; # vim
    }; # settings
  }; # programs.nvf
}
