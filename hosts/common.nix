{ config, pkgs, lib, ... }:
{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
