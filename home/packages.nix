{pkgs, ...}: {
  home.packages = with pkgs; [
    # Social
    ayugram-desktop

    # Development
    vscode
    gh
  ]; # home.packages

  programs = {
    firefox = {
      enable = true;
    }; # firefox
  }; # programs
}
