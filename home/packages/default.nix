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
    feh
    obinskit
    (callPackage /home/ch3rrix/dev/nixpkgs-test/pkgs/applications/misc/hexcore-link { })
    (callPackage ./obinskit.nix { })
  ];
}
