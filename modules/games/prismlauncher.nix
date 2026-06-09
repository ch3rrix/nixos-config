{
  flake.modules.nixos.games = { pkgs, ... }: {
    environment.systemPackages = with pkgs;
      [
        (prismlauncher.override {
          additionalPrograms = [ ffmpeg ];
          jdks =
            [ graalvmPackages.graalvm-ce zulu zulu8 zulu17 jdk21 jdk17 jdk8 ];
          gamemodeSupport = true;
          controllerSupport = true;
          textToSpeechSupport = true;
        })
      ];
  };
}
