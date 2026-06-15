{ self, ... }: {
  flake.modules.nixos.host_KVDR14 = {
    imports = with self.modules.nixos; [
      programs_telegram
      programs_throne
      programs_firefox
      programs_kitty
      programs_nautilus
      programs_graphics
      programs_throne
      programs_obsidian
    ];
  };
}
