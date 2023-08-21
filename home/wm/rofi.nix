{
  config,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "drun";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
    };
  };
}
