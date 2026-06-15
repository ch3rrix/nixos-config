{ inputs, ... }: {
  flake.modules.nixos.programs_zerotier =
    { config, ... }:
    {
      services.zerotierone = {
        enable = true;
      };
    };
}
