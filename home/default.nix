{...}: {
  imports = [
    ./git.nix
    ./packages.nix
    ./obs-studio.nix
    ./hyprland.nix
    ./kitty.nix
    ./neovim.nix
    ./v2raya.nix
  ]; # imports

  home = {
    stateVersion = "25.05";
  }; # home
}
