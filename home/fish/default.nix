{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    plugins = [

    ];
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };
}
