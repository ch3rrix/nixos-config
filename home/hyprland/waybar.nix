{ ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      bar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [ "eDP-1" ];
        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ "clock" ];
        modules-right = [ "hyprland/language" "network" "pulseaudio" "battery" "backlight" "tray" ];

        "hyprland/workspaces" = {
          format = "{name}: {icon}";
          format-icons = {
            active = "";
            default = "";
          };
        }; # "hyprland/workspaces"

        "clock" = {
          timezone = "Europe/Moscow";
          tooltip = "false";
          format = "{:%H:%M:%S - %A, %d}";
        }; # "clock"

        "network" = {
          format-wifi = "󰤢";
          format-ethernet = "󰈀 ";
          format-disconnected = "󰤠 ";
          interval = 5;
          tooltip-format = "{essid} ({signalStrength}%)";
          on-click = "nm-connection-editor";
        }; # network

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = ["" "󰃜" "󰃛" "󰃞" "󰃝" "󰃟" "󰃠"];
          tooltip = false;
        }; # "backlight"

        "pulseaudio" = {
          format = "{icon}  {volume}%";
          format-muted = "";
          format-icons = {
            default = ["" "" " "];
          };
          on-click = "pavucontrol";
        }; # "pulseaudio"

        "battery" = {
          interval = 2;
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-full = "{icon}  {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          # format-good = ""; # An empty format will hide the module
          # format-full = "";
          format-icons = ["" "" "" "" ""];
        }; # "battery"

      }; # bar
    }; # settings
    style = ''
      * {
        font-family: 'SFProDisplay Nerd Font', 'Inter', 'Segoe UI, NotoSans Nerd Font', sans-serif;
        font-size: 16px;
        min-height: 0;
        padding-right: 0px;
        padding-left: 0px;
        padding-bottom: 0px;
      }
      
      #waybar {
        background: transparent;
        margin: 0px;
       /* font-weight: 500; */
      }
      
      #workspaces {
        padding: 0.3rem 0.7rem;
        margin: 5px 0px; /* 5px top/bottom margin, 0px left/right (base for individual control) */
        border-radius: 6px; /* These modules are always rounded */
        min-width: 0;
        border: none;
        /* Transition for background-color and color only */
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }
      
      #workspaces {
        padding: 2px;
        margin-left: 7px; /* Margin from the far left edge */
        margin-right: 5px; /* Spacing after the workspaces module */
      }
      
      #workspaces button {
        border-radius: 5px; /* Workspaces buttons are always rounded */
        padding: 0.3rem 0.6rem;
        background: transparent;
        transition: all 0.2s ease-in-out;
        border: none;
        outline: none;
      }
      
      #clock {
        padding: 0.3rem 0.7rem;
        margin: 5px 0px;
        border-radius: 6px; /* This module is always rounded */
        min-width: 0;
        border: none;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }
      
      #bluetooth,
      #pulseaudio,
      #backlight,
      #network,
      #custom-lock,
      #battery {
        padding: 0.3rem 0.7rem;
        margin: 5px 0px; 
        border-radius: 0;
        box-shadow: none;
        min-width: 0;
        border: none;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
      }
      
      #bluetooth {
        margin-left: 0px; 
        border-top-left-radius: 6px;
        border-bottom-left-radius: 6px;
      }
      
      #battery {
        border-top-right-radius: 6px;
        border-bottom-right-radius: 6px;
      }

      #tray {
        margin-right: 7px;
      }
      
      #bluetooth {
        color: #888888;
        font-size: 16px;
      }
      tooltip {
        padding: 5px 12px;
        margin: 5px 0px;
        border-radius: 6px;
        font-size: 12px;
      }
    ''; # style
  }; # programs.waybar
}
