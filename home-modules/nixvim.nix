{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    withPython3 = true;
    withRuby = true;
    withNodeJs = true;

    plugins = {
      coq-nvim = {
        enable = true;
        installArtifacts = true;
      }; # plugins.coq-nvim

      cursorline = {
        enable = true;
      }; # plugins.cursorline

      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          nil_ls.enable = true;
        };
      }; # plugins.lsp

      mini = {
        enable = true;
      }; # plugins.mini

      nix = {
        enable = true;
      }; # plugins.nix

      nvim-surround = {
        enable = true;
      }; # plugins.nvim-surround

      nvim-tree = {
        enable = true;
      }; # plugins.nvim-tree

      oil = {
        enable = true;
      }; # plugins.oil

      telescope = {
        enable = true;
      }; # plugins.telescope
    }; # plugins.plugins
  }; # plugins.programs.neovim

}
