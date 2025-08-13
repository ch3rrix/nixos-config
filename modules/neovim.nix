{...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = true;
    withPython3 = true;
    withNodeJs = true;
    vimAlias = true;
    viAlias = true;
  };

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";
  };
}
