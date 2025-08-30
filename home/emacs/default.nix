{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;

    extraPackages = epkgs: [
      epkgs.magit
      epkgs.nix-mode
      epkgs.nixos-options
    ]; # extraPackages
  }; # programs.emacs

  services.emacs = {
    enable = true;
    startWithUserSession = "graphical";

    client = {
      enable = true;
    }; # client
  }; # services.emacs
}
