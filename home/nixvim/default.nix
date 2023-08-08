{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    colorschemes = {
      catppuccin = {
        enable = true;
        flavour = "mocha";
        integrations = {
          barbar = true;
          harpoon = true;
          neotree = true;
          telescope = true;
        };
      };
    };
    plugins = {
      lightline.enable = true;
      surround.enable = true;
      barbar.enable = true;
      clangd-extensions.enable = true;
      cursorline.enable = true;
      diffview.enable = true;
      harpoon.enable = true;
      markdown-preview.enable = true;
      oil.enable = true;
      telescope.enable = true;

      neo-tree = {
        enable = true;
        enableGitStatus = true;
      };
      lsp = {
        enable = true;
        servers = {
          #nixd.enable = true;
          nil_ls.enable = true;
          clangd.enable = true;
          cmake.enable = true;
        };
      };
      lsp-format = { enable = true; };
    };
  };
  home.packages = with pkgs; [
    nil
  ];
}
