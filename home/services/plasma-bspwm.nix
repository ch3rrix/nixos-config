{ pkgs, lib, ... }:
{
  systemd.user.services = {
    plasma-bspwm = {
      Install = {
        WantedBy = [ "plasma-workspace.target" ];
      };
      Unit = {
        Description = "Plasma-Bspwm Session";
        Before = [ "plasma-workspace.target" ];

      };
      Service = {
        ExecStart = "${pkgs.bspwm}/bin/bspwm";
        Slice = "session.slice";
        Restart = "on-failure";
      };
    }; # plasma-bspwm
  };
}
