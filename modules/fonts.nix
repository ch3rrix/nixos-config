{ config, pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      corefonts
      ubuntu_font_family
      powerline-fonts
      font-awesome
      source-code-pro
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      emojione
      jetbrains-mono
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Fira Code" "FireCode Nerd Font" ];
        sansSerif = [ "Fira Sans" "Ubuntu" "DejaVu Sans" "Noto Sans" ];
        serif = [ "Roboto Slab" "PT Serif" "Liberation Serif" "Noto Serif" ];
      };
    };
  };
}
