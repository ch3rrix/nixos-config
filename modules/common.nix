{ pkgs, lib, inputs, ... }: {
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    nixPath = [ "nixpkgs=${pkgs.path}" ];
    registry.n.flake = inputs.nixpkgs;
  };

  networking = {
    networkmanager.enable =
      true; # Easiest to use and most distros use this by default.
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
    packages = with pkgs; [ tree ];
  };

  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    nixd
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
}
