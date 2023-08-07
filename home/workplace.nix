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
        isDefault = true;
        search.engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          "NixOS Wiki" = {
            urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
            iconUpdateURL = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@nw" ];
          };
        }; # search engines

        search.order = [
          "NixOS Wiki"
          "Nix Packages"
        ];

        extraConfig = ''

	'';

        settings = {
          "browser.startup.homepage" = "https://nixos.org";
          "browser.search.region" = "GB";
          "browser.search.isUS" = false;

          "distribution.searchplugins.defaultLocale" = "en-GB";
          "general.useragent.locale" = "en-GB";
          "browser.bookmarks.showMobileBookmarks" = true;
          "browser.newtabpage.pinned" = [{
            title = "NixOS";
            url = "https://nixos.org";
          }];

        }; #settings


        bookmarks = [
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
