{ inputs, ... }:
{
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  }; # programs.quickshell
}
