{pkgs, ...}: {
  home.packages = with pkgs; [
    # Social
    ayugram-desktop

    # Development
    vscode
    code-cursor
    gh
    quickshell
    kdePackages.qtdeclarative

    # Games
    prismlauncher

    # Other utilities
    zip
    unzip
    ripgrep
    fzf
    killall
    htop-vim

    # Hyprland utilities
    playerctl

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
