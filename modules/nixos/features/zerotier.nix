_: {
  flake.modules.nixos.programs_zerotier =
    _:
    {
      services.zerotierone = {
        enable = true;
      };
    };
}
