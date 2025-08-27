{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
      input-overlay
      obs-backgroundremoval
      obs-pipewire-audio-capture
      advanced-scene-switcher
    ]; # plugins
  }; # programs.obs-studio
}
