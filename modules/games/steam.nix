{
  flake.modules.nixos.games =
    { pkgs, ... }:
    {
      programs.steam = {
        enable = true;
	extraPackages = with pkgs; [
	  gamescope
	];
	extraCompatPackages = with pkgs; [
	  proton-ge-bin
	];
      };

      hardware.steam-hardware.enable = true;
    };
}
