{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    withPython3 = true;
    withRuby = true;
    withNodeJs = true;
  }; # programs.neovim
}
