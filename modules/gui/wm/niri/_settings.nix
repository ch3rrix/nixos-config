{ self }: {
  input = {
    keyboard = {
      xkb = {
        layout = "us,ru";
        options = "grp:caps_toggle";
        model = "";
        rules = "";
        variant = "";
      };
      repeat-delay = 600;
      repeat-rate = 25;
      track-layout = "global";
    };
    touchpad = {
      tap = _: { };
      natural-scroll = _: { };
      dwt = _: { };
      accel-profile = "flat";
      disabled-on-external-mouse = _: { };
    };
    mouse = {
      accel-speed = 0;
      accel-profile = "flat";
    };
    trackpoint = {
      accel-speed = 0;
      accel-profile = "flat";
    };
    focus-follows-mouse = _: { };
  };

  outputs = {
    "eDP-1" = {
      mode = "1920x1080@60";
      scale = 1;
      transform = "normal";
      focus-at-startup = _: { };
    };
  };

  binds = {
    "Mod+O".toggle-overview = _: { };
    "Mod+D".spawn = "fuzzel";

    "Mod+Shift+Q".close-window = _: { };

    "Mod+Shift+F".fullscreen-window = _: { };

    "Mod+R".switch-preset-column-width = _: { };
    "Mod+F".maximize-column = _: { };

    "Mod+Plus".set-column-width = "+10%";
    "Mod+Minus".set-column-width = "-10%";

    "Mod+Shift+Plus".set-window-height = "+10%";
    "Mod+Shift+Minus".set-window-height = "-10%";

    "Mod+C".center-column = _: { };
    "Mod+Shift+C".center-visible-columns = _: { };

    "Mod+Shift+V".toggle-window-floating = _: { };
    "Mod+V".switch-focus-between-floating-and-tiling = _: { };

    "Mod+Up".focus-window-up = _: { };
    "Mod+Down".focus-window-down = _: { };
    "Mod+Right".focus-column-right = _: { };
    "Mod+Left".focus-column-left = _: { };

    "Mod+K".focus-window-up = _: { };
    "Mod+J".focus-window-down = _: { };
    "Mod+L".focus-column-right = _: { };
    "Mod+H".focus-column-left = _: { };

    "Mod+WheelScrollUp".focus-column-left = _: { };
    "Mod+WheelScrollDown".focus-column-right = _: { };
    "Mod+Shift+Up".move-window-up = _: { };
    "Mod+Shift+Down".move-window-down = _: { };
    "Mod+Shift+Right".move-column-right = _: { };
    "Mod+Shift+Left".move-column-left = _: { };
    "Mod+Shift+K".move-window-up = _: { };
    "Mod+Shift+J".move-window-down = _: { };
    "Mod+Shift+L".move-column-right = _: { };
    "Mod+Shift+H".move-column-left = _: { };

    "Mod+Shift+WheelScrollUp".move-column-left = _: { };
    "Mod+Shift+WheelScrollDown".move-column-right = _: { };

    "Mod+U".focus-workspace-down = _: { };
    "Mod+I".focus-workspace-up = _: { };
    "Mod+Page_Down".focus-workspace-down = _: { };
    "Mod+Page_Up".focus-workspace-up = _: { };

    "Mod+Shift+U".move-column-to-workspace-down = _: { };
    "Mod+Shift+I".move-column-to-workspace-up = _: { };
    "Mod+Shift+Page_Down".move-column-to-workspace-down = _: { };
    "Mod+Shift+Page_Up".move-column-to-workspace-up = _: { };

    "Mod+1".focus-workspace = 1;
    "Mod+2".focus-workspace = 2;
    "Mod+3".focus-workspace = 3;
    "Mod+4".focus-workspace = 4;
    "Mod+5".focus-workspace = 5;
    "Mod+6".focus-workspace = 6;
    "Mod+7".focus-workspace = 7;
    "Mod+8".focus-workspace = 8;
    "Mod+9".focus-workspace = 9;
    "Mod+0".focus-workspace = 10;

    "Mod+Shift+1".move-column-to-workspace = 1;
    "Mod+Shift+2".move-column-to-workspace = 2;
    "Mod+Shift+3".move-column-to-workspace = 3;
    "Mod+Shift+4".move-column-to-workspace = 4;
    "Mod+Shift+5".move-column-to-workspace = 5;
    "Mod+Shift+6".move-column-to-workspace = 6;
    "Mod+Shift+7".move-column-to-workspace = 7;
    "Mod+Shift+8".move-column-to-workspace = 8;
    "Mod+Shift+9".move-column-to-workspace = 9;
    "Mod+Shift+0".move-column-to-workspace = 10;

    "XF86AudioLowerVolume".spawn-sh =
      "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
    "XF86AudioRaiseVolume".spawn-sh =
      "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
    "XF86AudioMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    "XF86AudioMicMute".spawn-sh =
      "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    "XF86AudioPlay".spawn-sh = "playerctl play-pause";
    "XF86AudioStop".spawn-sh = "playerctl stop";
    "XF86AudioPrev".spawn-sh = "playerctl previous";
    "XF86AudioNext".spawn-sh = "playerctl next";
    "XF86MonBrightnessUp".spawn =
      [ "brightnessctl" "--class=backlight" "set" "+10%" ];
    "XF86MonBrightnessDown".spawn =
      [ "brightnessctl" "--class=backlight" "set" "10%-" ];
    "Print".screenshot = _: { };
  };

  prefer-no-csd = _: { };

  layout = {
    gaps = 8;
    struts = {
      left = 0;
      right = 0;
      top = 0;
      bottom = 0;
    };

    background-color = "transparent";
    focus-ring = {
      width = 2;
      inactive-color = self.theme.base01;
      active-color = self.theme.base0D;
    };
    border = { off = _: { }; };
    shadow = {
      on = _: { };
      offset = _: {
        props = {
          x = 2;
          y = 2;
        };
      };
      softness = 20;
      spread = 3;
      draw-behind-window = false;
      color = self.theme.base00;
    };
    default-column-width = { proportion = 0.5; };
    preset-column-widths = [
      { proportion = 0.333333; }
      { proportion = 0.5; }
      { proportion = 0.666667; }
      { proportion = 1.0; }
    ];
    center-focused-column = "never";
    always-center-single-column = _: { };
  };

  hotkey-overlay = { skip-at-startup = _: { }; };

  screenshot-path =
    "~/Pictures/Screenshots/%Y-%m-%d/screenshot-%Y-%m-%d%H-%M-%S.png";

  window-rule = {
    open-fullscreen = false;
    clip-to-geometry = true;
    geometry-corner-radius = 8;
  };

  layer-rules = [ ];
}
