{pkgs, ...}: {
  programs.fish = {
    enable = true;
    plugins = [
    ];
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "ls" = "exa";
    };
  };
}
