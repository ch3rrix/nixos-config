{...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    enableGitIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 16;
    }; # font
  }; # programs.kitty
}
