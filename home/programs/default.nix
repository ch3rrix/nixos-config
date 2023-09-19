{ config
, pkgs
, ...
}: {
  imports = [
    ./packages/screenrecord.nix
    ./packages/screenshot.nix
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
    feh
    qmk
    unrar
    exa
    ripgrep
    sd
    fzf
    pb_cli
    #lite-xl
    htop-vim

    obsidian
    #(callPackage ./packages/spotube { })
  ];
}
