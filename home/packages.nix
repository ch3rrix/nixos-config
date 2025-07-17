{pkgs, ...}: {
  home.packages = with pkgs; [
    # Social
    ayugram-desktop

    # Development
    vscode
    gh

    # Games
    prismlauncher

    # Other utilities
    zip
    unzip
    ripgrep
    fzf

    # Graphics/Video
    vlc
    krita
    inkscape
    gimp
    imgbrd-grabber
    brightnessctl
  ]; # home.packages

  programs = {
    firefox = {
      enable = true;
      profiles.default.extensions.force = true;
    }; # firefox
  }; # programs
}
