{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./waybar.nix
    ./quickshell.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    settings = {
      # Monitor configuration
      monitor = ",preferred,auto,1";

      # Environment variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # General settings
      general = {
        gaps_in = 6;
        gaps_out = 6;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Decoration settings
      decoration = {
        rounding = 13;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # Animation settings
      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1"
          "quick, 0.15, 0, 0.1, 1"
        ];

        animation = [
          "global, 1, 5, default"
          "border, 1, 2.50, easeOutQuint"
          "windows, 1, 2.50, easeOutQuint"
          "windowsIn, 1, 2, easeOutQuint, popin 87%"
          "windowsOut, 1, 1, linear, popin 87%"
          "fadeIn, 1, 1, almostLinear"
          "fadeOut, 1, 1, almostLinear"
          "fade, 1, 1.50, quick"
          "layers, 1, 1.50, easeOutQuint"
          "layersIn, 1, 2, easeOutQuint, fade"
          "layersOut, 1, 1, linear, fade"
          "fadeLayersIn, 1, 1, almostLinear"
          "fadeLayersOut, 1, 1, almostLinear"
          "workspaces, 1, 1, almostLinear, fade"
          "workspacesIn, 1, 1, almostLinear, fade"
          "workspacesOut, 1, 1, almostLinear, fade"
          "zoomFactor, 1, 3.5, quick"
        ];
      };

      # Workspace rules
      workspace = [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];

      # Window rules
      windowrule = [
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "rounding 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      # Dwindle layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Master layout
      master = {
        new_status = "master";
      };

      # Misc settings

      # Input settings
      input = {
        kb_layout = "us,ru";
        kb_variant = "";
        kb_model = "";
        kb_options = "grp:caps_toggle";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };

        scroll_factor = 0.33;
      };

      # This one is deprecated since commit 81bf4eccba449bfe2b6adfb51260108aec710d4f
      #
      # gestures = {
      #   workspace_swipe = true;
      # };
      gesture = ["3, horizontal, workspace"];

      # Device-specific settings
      device = [
        {
          name = "tpps/2-elan-trackpoint";
          sensitivity = -0.8;
        }
        {
          name = "synps/2-synaptics-touchpad";
          sensitivity = 0;
        }
      ];

      # Keybindings
      bind = [
        # Basic window management
        "$mainMod, Return, exec, $terminal"
        "$mainMod Shift, Q, killactive,"
        "$mainMod Shift, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod Shift, F, togglefloating,"
        "$mainMod, D, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, I, togglesplit,"
        "$mainMod, F, fullscreen"

        # Workspace navigation
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move windows to workspaces
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Mouse workspace switching
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Focus movement
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Window movement
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      binde = [
        # Window resizing
        "$mainMod ALT, H, resizeactive, -20 0"
        "$mainMod ALT, L, resizeactive, 20 0"
        "$mainMod ALT, K, resizeactive, 0 -20"
        "$mainMod ALT, J, resizeactive, 0 20"

        # Window moving (fine control)
        "$mainMod CONTROL, H, moveactive, -10 0"
        "$mainMod CONTROL, L, moveactive, 10 0"
        "$mainMod CONTROL, K, moveactive, 0 -10"
        "$mainMod CONTROL, J, moveactive, 0 10"
      ]; # binde

      # Volume and brightness controls
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      # Media controls
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Workspace cycling
      bindr = [
        "$mainMod, TAB, workspace, next"
        "$mainMod SHIFT, TAB, workspace, prev"
        "ALT, TAB, cyclenext"
        "SHIFT ALT, TAB, cyclenext, prev"
      ];

      # Variables
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";
      "$mainMod" = "SUPER";
    };
  }; # wayland.windowManager.hyprland
  programs = {
    wofi = {
      enable = true;
    }; # wofi

    fuzzel = {
      enable = true;
      package = pkgs.fuzzel;
      settings = {
        main = {
          terminal = "${pkgs.kitty}/bin/kitty";
          layer = "overlay";
        }; # fuzzel.settings.main
      }; # fuzzel.settings
    }; # fuzzel
  }; # programs
}
