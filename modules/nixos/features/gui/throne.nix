_: {
  flake.modules.nixos.programs_throne = _: {
    programs.throne = {
      enable = true;
      tunMode.setuid = true;
    };
  };
}
