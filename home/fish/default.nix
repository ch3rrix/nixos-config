{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    plugins = [
      {
      name = "nix-completions";
      src = pkgs.fetchFromGitHub {
        owner = "kidonng";
        repo = "nix-completions.fish";
        rev = "cd8a43bed96e0acc02228bc77502be8ba5fa0548";
        sha256 = "sha256-spnLmde41qQt8uJZFwiH0igFuVqZ6SvkwdA9Kbe2yz8=";
      };
  }
    ];
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };
}
