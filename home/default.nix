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
    stateVersion = "25.05";
  }; # home

  environment.variables = {
  	EDITOR = "nvim";
	VISUAL = "nvim";
	SUDO_EDITOR = "nvim";
  };
}
