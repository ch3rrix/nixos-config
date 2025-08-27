{lib, ...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    enableGitIntegration = true;
    font = {
      name = lib.mkForce "JetBrainsMono Nerd Font";
      size = lib.mkForce 16;
    }; # font
  }; # programs.kitty
}
