{ config, pkgs, home-manager, ... }: {
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "ch3rrix@waifu.club";
    userName = "ch3rrix";
  };

  programs.git-credential-oauth = { enable = true; };

  programs.gitui = { enable = true; };
}
