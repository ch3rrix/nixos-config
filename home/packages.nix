{pkgs, ...}: {
  home.packages = with pkgs; [
    # Social
    ayugram-desktop

    # Development
    vscode
    code-cursor
    gh
    kdePackages.qtdeclarative

    # Games
    prismlauncher

    # Other utilities
    p7zip-rar
    zip
    unzip
    ripgrep
    fzf
    killall
    htop-vim

    # Hyprland utilities
    playerctl
    wl-clipboard

    # Graphics/Video
    vlc
    krita
    inkscape
    gimp
    imgbrd-grabber
    brightnessctl
  ]; # home.packages

  programs = {
    btop.enable = true;
    yazi.enable = true;

    firefox = {
      enable = true;
      profiles = {
        default = {
          extensions = {
            force = true;
          }; # extensions
        }; # default
      }; # profiles
    }; # firefox
  }; # programs
}
