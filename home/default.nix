{...}: {
  imports = [
    ./git.nix
    ./packages.nix
    ./obs-studio.nix
    ./hyprland.nix
    ./kitty.nix
    ./neovim.nix
  ]; # imports

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      SUDO_EDITOR = "nvim";
    };
    stateVersion = "25.05";
  }; # home
}
