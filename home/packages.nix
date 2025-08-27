{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Social
    ayugram-desktop

    # Development
    vscode
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

    # Hyprland utilities
    wofi
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
