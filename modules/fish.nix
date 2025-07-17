{pkgs, ...}: {
  programs.fish.enable = true;

  users.users.ch3rrix.shell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    fishPlugins.fzf-fish
    fzf
    fishPlugins.grc
    grc
  ]; # environment.systemPackages
}
