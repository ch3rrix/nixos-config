{ self, ... }: {
  flake.modules.nixos.host_xenia = {
    imports = with self.modules.nixos; [
      programs_nautilus
      programs_zerotier
      programs_graphics
      programs_telegram
      programs_kitty
      programs_firefox
      programs_throne
      programs_thunderbird
      programs_obsidian
    ];
  };
}
