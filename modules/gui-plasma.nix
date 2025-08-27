{pkgs, ...}: {
  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
    libinput.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us,ru";
        options = "grp:caps_toggle";
      }; # xkb
    }; # xserver
  }; # services
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.sddm-kcm
    kdePackages.kdeconnect-kde
  ]; # environment.systemPackages
  programs.kdeconnect.enable = true;
}
