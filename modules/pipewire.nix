{
  pkgs,
  lib,
  ...
}: {
  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = [
            "hsp_hs"
            "hsp_ag"
            "hfp_hf"
            "hfp_ag"
          ];
        }; # "monitor.bluez.properties" = {
      }; # wireplumber.extraConfig.bluetoothEnhancements
    }; # pipewire
  }; # services

  environment.systemPackages = lib.attrValues {
    inherit
      (pkgs)
      # sound
      helvum
      pavucontrol
      easyeffects
      ;
  }; # systemPackages
}
