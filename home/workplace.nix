{ pkgs, ... }: {
  imports = [
    ./packages
    #   ./neovim
    ./nixvim
    ./vscode
    ./wm
    ./alacritty
    ./firefox
    ./git
    ./eww
    ./theme/catppuccin
    ./java
    ./emacs
    ./fonts
    ./lw-test/librewolf.nix
  ];

  programs.librewolf1 = {
    enable = true;
    profiles = {
      test = {
        bookmarks = [
          {
            name = "wikipedia";
            tags = [ "wiki" ];
            keyword = "wiki";
            url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
          }
          {
            name = "kernel.org";
            url = "https://www.kernel.org";
          }
          {
            name = "Nix sites";
            toolbar = true;
            bookmarks = [
              {
                name = "homepage";
                url = "https://nixos.org/";
              }
              {
                name = "wiki";
                tags = [ "wiki" "nix" ];
                url = "https://nixos.wiki/";
              }
            ];
          }
        ];
      };
    };
  };

  home = {
    username = "ch3rrix";
    homeDirectory = "/home/ch3rrix";
    stateVersion = "23.05";
  };
}
