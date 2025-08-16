{ pkgs, ... }:
{
  home = {
    username = "ch3rrix";
    stateVersion = "25.11";
    homeDirectory = "/home/ch3rrix";
  }; # home

  programs.git = {
    userName = "Ruslan Rakshinsky";
    userEmail = "ch3rrix@proton.me";
  }; # programs.git
}
