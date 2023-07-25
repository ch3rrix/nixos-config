{ config, pkgs, lib, ... }:
{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking = {
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    useDHCP = lib.mkDefault true;
  };

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #   keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  users.users.ch3rrix = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkManager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
}
