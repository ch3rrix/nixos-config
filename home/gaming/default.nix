{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    prismlauncher
    minetest
    steam
  ];
}
