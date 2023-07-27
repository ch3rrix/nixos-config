{config, pkgs, home-manager, inputs, ... }:
let username = "ch3rrix"; in
{
  home-manager.users.${username} = {
    modules = [ inputs.catppuccin.homeManagerModules.catppuccin ];
  };
}
