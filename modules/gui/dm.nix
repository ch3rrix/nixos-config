{
  flake.modules.nixos.wm = { config, lib, pkgs, ... }:
    let
      inherit (config.custom.constants) user;
      exe = lib.getExe pkgs.tuigreet;
    in {
      environment.systemPackages = [ pkgs.tuigreet ];
      services.greetd = {
        enable = true;
        useTextGreeter = true;
        settings = {
          default_session = {
            command = "${exe} -r --cmd niri-session";
            user = "greeter";
          };
        };
      };
    };
}
