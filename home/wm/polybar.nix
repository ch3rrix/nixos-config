{ config, pkgs, osConfig, ... }: {
  services.polybar = {
    enable = true;
    package = pkgs.polybarFull;
    #.override {
    #  pulseSupport = true;
    #  alsaSupport = true;
    #  iwSupport = true;
    #  githubSupport = true;
    #};
    script = "polybar -q bar &";
    settings = {
      "global/wm" = {
        margin-top = 0;
        margin-bottom = 0;
      }; # global/wm

      "settings".screenchange-reload = true;

      "bar/bar" = {
        monitor =
          if osConfig.networking.hostName == "xenia"
          then "\${env:MONITOR:HDMI-0}"
          else "\${env:MONITOR:HDMI-1}";
        width = "100%";
        height = "24px";
        radius = 0;
        fixed-center = true;
        border-size = 4;
        padding = 0;
        module-margin = 1;
        font-0 = "JetBrainsMono Nerd Font:style=Medium:size=11;2";
        font-1 = "Font Awesome 6 Free:style=Regular:size=11;2";
        font-2 = "EmojiOne Color:style=Regular:size=11;2";
        font-3 = "Noto Color Emoji:style=Regular:size=11;2";

        background = "#1e1e2e";
        border-color = "transparent";

        tray-position = "right";
        modules-left = "bspwm";
        modules-center = "time";
        modules-right = "xkeyboard pulseaudio date";

        wm-restack = "bspwm";
      }; # bar/bar

      "module/bspwm" = {
        type = "internal/bspwm";

        pin-workspaces = true;

        format = "<label-state> <label-mode>";

        label-focused = "%name%";
        label-focused-foreground = "#cdd6f4";
        label-focused-background = "#94e2d5";
        label-focused-padding = 2;

        label-occupied = "%name%";
        label-occupied-foreground = "#cdd6f4";
        label-occupied-padding = 2;
        label-urgent = "%name%";

        label-urgent-background = "#f38ba8";
        label-urgent-foreground = "#cdd6f4";
        label-urgent-overline = "#1e1e2e";
        label-urgent-underline = "#1e1e2e";
        label-urgent-padding = 2;

        label-empty = "%name%";
        label-empty-foreground = "#a6adc8";
        label-empty-padding = 2;
      };

      "module/time" = {
        type = "internal/date";
        interval = 5;
        time = "%I:%M %p";
        time-alt = "%A, %d %B %Y";
        label = "%time%";
      };

      "module/date" = {
        type = "internal/date";
        interval = 5;
        time = "%A, %d %B %Y";
        time-alt = "%I:%M %p";
        label = "%time%";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        use-ui-max = if osConfig.networking.hostName == "workplace" then true else false;
        interval = 5;
        format-volume = "<ramp-volume><label-volume>";
        format-volume-foreground = "#a633a1";
        label-volume = "%percentage%%";
        label-volume-padding = 1;

        format-muted-foreground = "#f38ba8";
        #format-muted-prefix = "ﱝ";
        format-muted-prefix-padding = 1;
        label-muted = " muted";
        label-muted-padding = 1;

        ramp-volume-0 = "";
        ramp-volume-1 = "";
        ramp-volume-2 = "";
        ramp-volume-padding = 0;
        click-right = "pavucontrol";
      }; # module/pulseaudio

      "module/xkeyboard" = {
        type = "internal/xkeyboard";

        blacklist-0 = "num lock";
        blacklist-1 = "scroll lock";
        format-foreground = "#a6adc8";
        format-prefix = "";
        format-prefix-padding = 1;
        label-layout = "%layout%";
        label-layout-padding = 1;

        label-indicator-foreground = "#f38ba8";
        label-indicator-padding = 1;
      }; # module/xkeyboard
    }; # settings
  };
}
