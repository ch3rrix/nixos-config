{}:
{
  imports = [ ./bspwm/bspwm.nix ];
  xsession.windowManager.bspwm = {
    rules = {
      "*:pavucontrol" = { state = "floating"; };
      "*:yakuake" = { state = "floating"; };
      "*:lattedock" = { state = "floating"; };
      "*:plasmashell" = { state = "floating"; };
      "*:Kmix" = { state = "floating"; border = false; };
      "*:kruler" = { state = "floating"; border = false; };
      "*:Plasma" = { state = "floating"; border = false; };
      "*:Klipper" = { state = "floating"; border = false; };
      "*:krunner" = { state = "floating"; border = false; };
      "*:Plasmoidviewer" = { state = "floating"; border = false; };
      "*:plasma-desktop" = { state = "floating"; border = false; };
    };
  };
}
