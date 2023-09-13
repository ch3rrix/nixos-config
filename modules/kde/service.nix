{}:
{
  systemd.user.services.plasma-bspwm = {
    wantedBy = [
      "plasma-workspace.target"
    ];
  };
}
