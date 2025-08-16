{ nixvim, ... }: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    withPython3 = true;
    withRuby = true;
    withNodeJs = true;
  }; # programs.neovim
}
