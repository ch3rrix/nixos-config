{...}: {
  imports = [
    ./git.nix
    ./packages.nix
  ]; # imports

  home = {
    stateVersion = "25.05";
  }; # home
}
