_: {
  flake.modules.nixos.programs_firefox = _: {
    programs.firefox = {
      enable = true;
      languagePacks = [ "ru" ];
    };
  };
}
