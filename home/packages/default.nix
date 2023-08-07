{ config, pkgs, ... }: {
  imports = [
    ./screenrecord.nix
    ./screenshot.nix
  ];
  home.packages = with pkgs; [
    telegram-desktop
    pavucontrol
    libnotify
    hunspell
    hunspellDicts.ru_RU
    libreoffice-qt
    bat
    jq
    dconf
    nixpkgs-fmt
    nixfmt
    xclip
    ksnip
    cloc
    translate-shell
    ffmpeg-full
    mpv
<<<<<<< HEAD
    slop
    mat2
    xdragon
    scrot
    maim
=======
    feh
    krita
>>>>>>> e0ac9a9b1d864ce2f07e875f049b73609a13b3b4
  ];
}
