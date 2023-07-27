{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      colors ={
        primary = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
          dim_foreground = "cdd6f4";
          bright_foreground = "#cdd6f4";
        };
      };
    };
  };
}
