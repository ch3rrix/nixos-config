{inputs, ...}: {
  imports = [inputs.nixvim.homeModules.nixvim];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    withPerl = true;
    luaLoader.enable = true;

    performance = {
      byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        luaLib = true;
        nvimRuntime = true;
        plugins = true;
      }; # byteCompileLua
    }; # performance

    clipboard.providers = {
      wl-copy.enable = true;
    }; # clipboard.providers

    dependencies = {
      bat.enable = true;
      fzf.enable = true;
      git.enable = true;
      ripgrep.enable = true;
    }; # dependencies

    lsp = {
      # onAttach = ;
      servers = {
        nil_ls = {
          enable = true;
        }; # nil_ls
      }; # servers
    }; # lsp

    plugins = {
    }; # plugins
  }; # programs.nixvim
}
