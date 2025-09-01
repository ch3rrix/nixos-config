{pkgs, ...}: {
  programs.fish.enable = true;

  users.users.ch3rrix.shell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    fishPlugins.fzf-fish
    fishPlugins.fzf
    # fishPlugins.fifc
    fzf
    fishPlugins.grc
    grc
    fishPlugins.z
    fishPlugins.forgit
    fishPlugins.hydro
  ]; # environment.systemPackages
}
