{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    prismlauncher
    steam
    steamcontroller
    minetest
  ];
}
