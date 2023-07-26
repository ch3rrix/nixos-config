{ config, pkgs, ... }:
{
  services.polybar = {
    enable = true;
    config = {
      "bar/top" = {
        monitor = "\${env:MONITOR:HDMI-1}";
	width = "100%";
	height = "24px";
	radius = 0;
	modules-center = "date";
      };

      "module/date" = {
        type = "internal/date";
	interval = 5;
	date = "%d.%m.%y";
	time = "%H:%M";
	label = "%time% %date%";
      };
    };
  };
}
