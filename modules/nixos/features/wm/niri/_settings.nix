{ self }: {
  input = {
    keyboard = {
      xkb = {
        layout = "us,ru";
        options = "grp:caps_toggle";
      };
    };
    touchpad = {
      tap = _: { };
      dwt = _: { };
      natural-scroll = _: { };
      accel-profile = "flat";
      disabled-on-external-mouse = _: { };
    };
    mouse = {
      accel-profile = "flat";
    };
    trackpoint = {
      accel-profile = "flat";
    };
    tablet = {
      map-to-output = "eDP-1";
    };
    # Uncomment this to make the mouse warp to the center of newly focused windows.
    # warp-mouse-to-focus
    # warp-mouse-to-focus mode="center-xy"
    # focus-follows-mouse max-scroll-amount="10%"
    workspace-auto-back-and-forth = _: { };
    # Focus windows and outputs automatically when moving the mouse into them.
    # Setting max-scroll-amount="0%" makes it work only on windows already fully on screen.
    focus-follows-mouse = _: { max-scroll-amount = "20%"; };
  };
  # environment {
  #   ELECTRON_OZONE_PLATFORM_HINT "auto"
  #   _JAVA_AWT_WM_NONREPARENTING "1"
  #   QT_QPA_PLATFORMTHEME "qt6ct"
  # }
  overview = {
    backdrop-color = self.theme.base02;
  };
  layer-rules = [
    {
      matches = [ { namespace = "^wallpaper$"; } ];
      place-within-backdrop = false;
    }
  ];
  window-rules = [
    {
      geometry-corner-radius = 8;
      clip-to-geometry = true;
    }

    {
      matches = [
        {
          app-id = "firefox$";
          title = "^Picture-in-Picture$";
        }
      ];
      open-floating = true;
    }

    # {
    #   matches = [
    #     {
    #       app-id = "steam";
    #       title = "^notificationtoasts_\\d+_desktop$";
    #     }
    #   ];
    #   default-floating-position = {
    #     _attrs = {
    #       x = 10;
    #       y = 10;
    #       relative-to = "bottom-right";
    #     };
    #   };
    # }
  ];
  layout = {
    gaps = 8;
    background-color = "transparent";
    center-focused-column = "never";
    always-center-single-column = _: { };
    preset-column-widths = [
      { proportion = 0.25; }
      { proportion = 0.33333; }
      { proportion = 0.5; }
      { proportion = 0.66667; }
      { proportion = 0.75; }
    ];
    default-column-width = {
      proportion = 0.5;
    };
    # If you leave the brackets empty, the windows themselves will decide their initial width.
    # default-column-width {}
    # By default focus ring and border are rendered as a solid background rectangle
    # behind windows. That is, they will show up through semitransparent windows.
    # This is because windows using client-side decorations can have an arbitrary shape.
    #
    # If you don't like that, you should uncomment `prefer-no-csd` below.
    # Niri will draw focus ring and border *around* windows that agree to omit their
    # client-side decorations.
    #
    # Alternatively, you can override it with a window rule called
    # `draw-border-with-background`.
    # You can change how the focus ring looks.
    focus-ring = {
      width = 2;
      inactive-color = self.theme.base01;
      active-color = self.theme.base0D;
    };
    insert-hint = {
      color = self.theme.base0D;
    };
    border.off = _: { };
    # You can enable drop shadows for windows.
    shadow = {
      on = _: { };
      softness = 30;
      spread = 5;
      # "offset" = {
      #   _attrs = {
      #     x = 0;
      #     y = 0;
      #   };
      # };
      color = self.theme.base00;
    };
    struts = {
      # left = 64;
      # right = 64;
      # top = 64;
      # bottom = 64;
    };
  };

  hotkey-overlay = {
    # Uncomment this line to disable the "Important Hotkeys" pop-up at startup.
    skip-at-startup = _: { };
  };
  prefer-no-csd = _: { };
  screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d/screenshot-%Y-%m-%d%H-%M-%S.png";
  animations = {
    slowdown = 0.75;
  };

  binds = {
    "Mod+D" = {
      spawn = "fuzzel";
    };
    "Super+Shift+Alt+L" = {
      spawn-sh = "loginctl lock-session";
    };
    "Mod+P" = {
      spawn-sh = "makoctl dismiss -a";
    };
    "Mod+Shift+P" = {
      spawn-sh = "makoctl restore";
    };
    "XF86AudioRaiseVolume" = {
      spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
    };
    "XF86AudioLowerVolume" = {
      spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
    };
    "XF86AudioMute" = {
      spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    };
    "XF86AudioMicMute" = {
      spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    };
    "XF86AudioPlay" = {
      spawn-sh = "playerctl play-pause";
    };
    "XF86AudioStop" = {
      spawn-sh = "playerctl stop";
    };
    "XF86AudioPrev" = {
      spawn-sh = "playerctl previous";
    };
    "XF86AudioNext" = {
      spawn-sh = "playerctl next";
    };
    "XF86MonBrightnessUp" = {
      spawn = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "+10%"
      ];
    };
    "XF86MonBrightnessDown" = {
      spawn = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "10%-"
      ];
    };
    "Mod+O" = {
      # _attrs = {
      #   repeat = false;
      # };
      toggle-overview = _: { };
    };
    "Mod+Shift+Q" = {
      # _attrs = {
      #   repeat = false;
      # };
      close-window = _: { };
    };
    "Mod+Left" = {
      focus-column-left = _: { };
    };
    "Mod+Down" = {
      focus-window-down = _: { };
    };
    "Mod+Up" = {
      focus-window-up = _: { };
    };
    "Mod+Right" = {
      focus-column-right = _: { };
    };
    "Mod+H" = {
      focus-column-left = _: { };
    };
    "Mod+J" = {
      focus-window-down = _: { };
    };
    "Mod+K" = {
      focus-window-up = _: { };
    };
    "Mod+L" = {
      focus-column-right = _: { };
    };
    "Mod+Shift+Left" = {
      move-column-left = _: { };
    };
    "Mod+Shift+Down" = {
      move-window-down = _: { };
    };
    "Mod+Shift+Up" = {
      move-window-up = _: { };
    };
    "Mod+Shift+Right" = {
      move-column-right = _: { };
    };
    "Mod+Shift+H" = {
      move-column-left = _: { };
    };
    "Mod+Shift+J" = {
      move-window-down = _: { };
    };
    "Mod+Shift+K" = {
      move-window-up = _: { };
    };
    "Mod+Shift+L" = {
      move-column-right = _: { };
    };
    "Mod+Home" = {
      focus-column-first = _: { };
    };
    "Mod+End" = {
      focus-column-last = _: { };
    };
    "Mod+Ctrl+Home" = {
      move-column-to-first = _: { };
    };
    "Mod+Ctrl+End" = {
      move-column-to-last = _: { };
    };
    "Mod+Shift+Ctrl+Left" = {
      move-column-to-monitor-left = _: { };
    };
    "Mod+Shift+Ctrl+Down" = {
      move-column-to-monitor-down = _: { };
    };
    "Mod+Shift+Ctrl+Up" = {
      move-column-to-monitor-up = _: { };
    };
    "Mod+Shift+Ctrl+Right" = {
      move-column-to-monitor-right = _: { };
    };
    "Mod+Shift+Ctrl+H" = {
      move-column-to-monitor-left = _: { };
    };
    "Mod+Shift+Ctrl+J" = {
      move-column-to-monitor-down = _: { };
    };
    "Mod+Shift+Ctrl+K" = {
      move-column-to-monitor-up = _: { };
    };
    "Mod+Shift+Ctrl+L" = {
      move-column-to-monitor-right = _: { };
    };
    "Mod+Page_Down" = {
      focus-workspace-down = _: { };
    };
    "Mod+Page_Up" = {
      focus-workspace-up = _: { };
    };
    "Mod+U" = {
      focus-workspace-down = _: { };
    };
    "Mod+I" = {
      focus-workspace-up = _: { };
    };
    "Mod+Shift+Page_Down" = {
      move-column-to-workspace-down = _: { };
    };
    "Mod+Shift+Page_Up" = {
      move-column-to-workspace-up = _: { };
    };
    "Mod+Shift+U" = {
      move-column-to-workspace-down = _: { };
    };
    "Mod+Shift+I" = {
      move-column-to-workspace-up = _: { };
    };
    "Mod+Ctrl+Page_Down" = {
      move-workspace-down = _: { };
    };
    "Mod+Ctrl+Page_Up" = {
      move-workspace-up = _: { };
    };
    "Mod+Ctrl+U" = {
      move-workspace-down = _: { };
    };
    "Mod+Ctrl+I" = {
      move-workspace-up = _: { };
    };
    "Mod+Ctrl+Left" = {
      focus-monitor-left = _: { };
    };
    "mod+ctrl+Down" = {
      focus-monitor-down = _: { };
    };
    "mod+ctrl+Up" = {
      focus-monitor-up = _: { };
    };
    "Mod+Ctrl+Right" = {
      focus-monitor-right = _: { };
    };
    "Mod+Ctrl+H" = {
      focus-monitor-left = _: { };
    };
    "mod+ctrl+J" = {
      focus-monitor-down = _: { };
    };
    "mod+ctrl+K" = {
      focus-monitor-up = _: { };
    };
    "Mod+Ctrl+L" = {
      focus-monitor-right = _: { };
    };
    "Mod+WheelScrollDown" = {
      # _attrs = {
      #   cooldown-ms = 150;
      # };
      focus-workspace-down = _: { };
    };
    "Mod+WheelScrollUp" = {
      focus-workspace-up = _: { };
      # _attrs = {
      #   cooldown-ms = 150;
      # };
    };
    "Mod+Ctrl+WheelScrollDown" = {
      # _attrs = {
      #   cooldown-ms = 150;
      # };
      move-column-to-workspace-down = _: { };
    };
    "Mod+Ctrl+WheelScrollUp" = {
      move-column-to-workspace-up = _: { };
      # _attrs = {
      #   cooldown-ms = 150;
      # };
    };
    "Mod+WheelScrollRight" = {
      focus-column-right = _: { };
    };
    "Mod+WheelScrollLeft" = {
      focus-column-left = _: { };
    };
    "Mod+Ctrl+WheelScrollRight" = {
      move-column-right = _: { };
    };
    "Mod+Ctrl+WheelScrollLeft" = {
      move-column-left = _: { };
    };
    "Mod+Shift+WheelScrollDown" = {
      focus-column-right = _: { };
    };
    "Mod+Shift+WheelScrollUp" = {
      focus-column-left = _: { };
    };
    "Mod+Ctrl+Shift+WheelScrollDown" = {
      move-column-right = _: { };
    };
    "Mod+Ctrl+Shift+WheelScrollUp" = {
      move-column-left = _: { };
    };
    "Mod+1" = {
      focus-workspace = 1;
    };
    "Mod+2" = {
      focus-workspace = 2;
    };
    "Mod+3" = {
      focus-workspace = 3;
    };
    "Mod+4" = {
      focus-workspace = 4;
    };
    "Mod+5" = {
      focus-workspace = 5;
    };
    "Mod+6" = {
      focus-workspace = 6;
    };
    "Mod+7" = {
      focus-workspace = 7;
    };
    "Mod+8" = {
      focus-workspace = 8;
    };
    "Mod+9" = {
      focus-workspace = 9;
    };
    "Mod+Shift+1" = {
      move-column-to-workspace = 1;
    };
    "Mod+Shift+2" = {
      move-column-to-workspace = 2;
    };
    "Mod+Shift+3" = {
      move-column-to-workspace = 3;
    };
    "Mod+Shift+4" = {
      move-column-to-workspace = 4;
    };
    "Mod+Shift+5" = {
      move-column-to-workspace = 5;
    };
    "Mod+Shift+6" = {
      move-column-to-workspace = 6;
    };
    "Mod+Shift+7" = {
      move-column-to-workspace = 7;
    };
    "Mod+Shift+8" = {
      move-column-to-workspace = 8;
    };
    "Mod+Shift+9" = {
      move-column-to-workspace = 9;
    };
    "Mod+BracketLeft" = {
      consume-or-expel-window-left = _: { };
    };
    "Mod+BracketRight" = {
      consume-or-expel-window-right = _: { };
    };
    "Mod+Comma" = {
      consume-window-into-column = _: { };
    };
    "Mod+Period" = {
      expel-window-from-column = _: { };
    };
    "Mod+R" = {
      switch-preset-column-width = _: { };
    };
    "Mod+Shift+R" = {
      switch-preset-column-width-back = _: { };
    };
    "Mod+Ctrl+Shift+R" = {
      switch-preset-window-height = _: { };
    };
    "Mod+Ctrl+R" = {
      reset-window-height = _: { };
    };
    "Mod+F" = {
      maximize-column = _: { };
    };
    "Mod+Shift+F" = {
      fullscreen-window = _: { };
    };
    "Mod+M" = {
      maximize-window-to-edges = _: { };
    };
    "Mod+Ctrl+F" = {
      expand-column-to-available-width = _: { };
    };
    "Mod+C" = {
      center-column = _: { };
    };
    "Mod+Ctrl+C" = {
      center-visible-columns = _: { };
    };
    "Mod+Minus" = {
      set-column-width = "-10%";
    };
    "Mod+Equal" = {
      set-column-width = "+10%";
    };
    "Mod+Shift+Minus" = {
      set-window-height = "-10%";
    };
    "Mod+Shift+Equal" = {
      set-window-height = "+10%";
    };
    "Mod+Shift+V" = {
      toggle-window-floating = _: { };
    };
    "Mod+V" = {
      switch-focus-between-floating-and-tiling = _: { };
    };
    "Mod+W" = {
      toggle-column-tabbed-display = _: { };
    };
    "Print" = {
      screenshot = _: { };
    };
    "Mod+Print" = {
      screenshot-screen = _: { };
    };
    "Alt+Print" = {
      screenshot-window = _: { };
    };
    "Mod+Escape" = {
      toggle-keyboard-shortcuts-inhibit = _: { };
    };
    "Ctrl+Alt+Delete" = {
      quit = _: { };
    };
  };
}
