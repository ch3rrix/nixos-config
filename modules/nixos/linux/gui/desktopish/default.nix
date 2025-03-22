{ pkgs, ... }: {
  imports = [
    # Isolated features
    ./autolock.nix
    ./fonts.nix
    ./gnome-keyring.nix
    ./guiapps.nix
    ./hidpi.nix
    ./hotplug.nix
    ./light-terminal.nix
    ./polybar.nix
    ./redshift.nix
    ./screencapture.nix
    ./swap-caps-ctrl.nix
    ./touchpad-trackpoint.nix

    # WMish things
    ./xmonad
    #./taffybar # Disabled, because it rarely works (and memory hungry)
    # ./xmobar # shit UX
  ];

  environment.systemPackages = with pkgs; [
    acpi
    mpv
    youtube-dl
    xorg.xmessage
  ];

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
  };

  # Speed up boot
  # https://discourse.nixos.org/t/boot-faster-by-disabling-udev-settle-and-nm-wait-online/6339
  systemd.services.systemd-udev-settle.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

}
