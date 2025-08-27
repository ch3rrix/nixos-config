{pkgs, ...}: {
  boot.plymouth = {
    enable = true;
    #themePackages = with pkgs; [
    #  (catppuccin-plymouth.override {
    #    variant = "mocha";
    #  })
    #]; # themePackages
    #theme = "catppuccin-mocha";
  }; # boot.plymouth
}
