{ config, pkgs, ... }:
let username = "ch3rrix"; in
{
  programs.fish.enable = true;
  users.users.${username}.shell = pkgs.fish;
}
