{ self, ... }: ''
  /* Catppuccin Mocha */
  @define-color background ${self.theme.base00};
  @define-color background-light ${self.theme.base01};
  @define-color crust ${self.theme.base00};
  @define-color surface0 ${self.theme.base00};
  @define-color foreground ${self.theme.base07};
  @define-color black ${self.theme.base01};
  @define-color red ${self.theme.base08};
  @define-color green ${self.theme.base0B};
  @define-color yellow ${self.theme.base0A};
  @define-color blue ${self.theme.base0D};
  @define-color magenta ${self.theme.base0E};
  @define-color cyan ${self.theme.base0C};
  @define-color white ${self.theme.base07};
  @define-color orange ${self.theme.base09};

  /* Module-specific colors */
  @define-color workspaces-color @foreground;
  @define-color workspaces-focused-bg @blue;
  @define-color workspaces-focused-fg @foreground;
  @define-color workspaces-urgent-bg @red;
  @define-color workspaces-urgent-fg @black;

  /* Text and border colors for modules */
  @define-color mode-color @orange;
  @define-color group-hardware-color @blue;
  @define-color group-session-color @red;
  @define-color clock-color @blue;
  @define-color cpu-color @green;
  @define-color memory-color @magenta;
  @define-color temperature-color @yellow;
  @define-color temperature-critical-color @red;
  @define-color battery-color @cyan;
  @define-color battery-charging-color @green;
  @define-color battery-warning-color @yellow;
  @define-color battery-critical-color @red;
  @define-color network-color @blue;
  @define-color network-disconnected-color @red;
  @define-color pulseaudio-color @orange;
  @define-color pulseaudio-muted-color @red;
  @define-color wireplumber-color @orange;
  @define-color wireplumber-muted-color @red;
  @define-color backlight-color @yellow;
  @define-color disk-color @cyan;
  @define-color updates-color @orange;
  @define-color quote-color @green;
  @define-color niri-language-color @peach;
  @define-color idle-inhibitor-color @foreground;
  @define-color idle-inhibitor-active-color @red;
  @define-color power-profiles-daemon-color @cyan;
  @define-color power-profiles-daemon-performance-color @red;
  @define-color power-profiles-daemon-balanced-color @yellow;
  @define-color power-profiles-daemon-power-saver-color @green;

  * {
      /* Base styling for all modules */
      border: none;
      border-radius: 0;
      font-family: "Iosevka Nerd Font Propo";
      font-size: 16px;
      min-height: 0;
  }

  window#waybar {
      margin-top: 2px;
      background: @background;
      color: @foreground;
  }


  /* Common module styling with top border */
  #mode,
  #custom-hardware-wrap,
  #custom-session-wrap,
  #clock,
  #cpu,
  #memory,
  #temperature,
  #battery,
  #network,
  #pulseaudio,
  #wireplumber,
  #backlight,
  #disk,
  #power-profiles-daemon,
  #idle_inhibitor,
  #language,
  #tray {
      min-height: 24px;
      padding: 0 10px;
      margin: 0 2px 0 2px;
      border-top: 2px solid transparent;
      background-color: transparent;
  }

  /* Workspaces styling */
  #workspaces button {
      padding: 0 10px;
      background-color: transparent;
      color: @workspaces-color;
      margin: 0;
  }

  #workspaces button:hover {
      background: @background-light;
      box-shadow: inherit;
  }

  #workspaces button.focused {
      box-shadow: inset 0 2px @workspaces-focused-fg;
      color: @workspaces-focused-fg;
      font-weight: 900;
  }

  #workspaces button.urgent {
      background-color: @workspaces-urgent-bg;
      color: @workspaces-urgent-fg;
  }

  /* Module-specific styling */
  #mode {
      color: @mode-color;
      border-top-color: @mode-color;
  }

  #custom-hardware-wrap {
      color: @group-hardware-color;
      border-top-color: @group-hardware-color;
  }

  #custom-session-wrap {
      color: @group-session-color;
      border-top-color: @group-session-color;
  }

  #clock {
      color: @clock-color;
      border-top-color: @clock-color;
  }

  #cpu {
      color: @cpu-color;
      border-top-color: @cpu-color;
  }

  #memory {
      color: @memory-color;
      border-top-color: @memory-color;
  }

  #temperature {
      color: @temperature-color;
      border-top-color: @temperature-color;
  }

  #temperature.critical {
      color: @temperature-critical-color;
      border-top-color: @temperature-critical-color;
  }


  #power-profiles-daemon {
      color: @power-profiles-daemon-color;
      border-top-color: @power-profiles-daemon-color;
  }

  #power-profiles-daemon.performance {
      color: @power-profiles-daemon-performance-color;
      border-top-color: @power-profiles-daemon-performance-color;
  }

  #power-profiles-daemon.balanced {
      color: @power-profiles-daemon-balanced-color;
      border-top-color: @power-profiles-daemon-balanced-color;
  }

  #power-profiles-daemon.power-saver {
      color: @power-profiles-daemon-power-saver-color;
      border-top-color: @power-profiles-daemon-power-saver-color;
  }

  #battery {
      color: @battery-color;
      border-top-color: @battery-color;
  }

  #battery.charging,
  #battery.plugged {
      color: @battery-charging-color;
      border-top-color: @battery-charging-color;
  }

  #battery.warning:not(.charging) {
      color: @battery-warning-color;
      border-top-color: @battery-warning-color;
  }

  #battery.critical:not(.charging) {
      color: @battery-critical-color;
      border-top-color: @battery-critical-color;
  }

  #network {
      color: @network-color;
      border-top-color: @network-color;
  }

  #network.disconnected {
      color: @network-disconnected-color;
      border-top-color: @network-disconnected-color;
  }

  #pulseaudio {
      color: @pulseaudio-color;
      border-top-color: @pulseaudio-color;
  }

  #pulseaudio.muted {
      color: @pulseaudio-muted-color;
      border-top-color: @pulseaudio-muted-color;
  }

  #wireplumber {
      color: @wireplumber-color;
      border-top-color: @wireplumber-color;
  }

  #wireplumber.muted {
      color: @wireplumber-muted-color;
      border-top-color: @wireplumber-muted-color;
  }

  #backlight {
      color: @backlight-color;
      border-top-color: @backlight-color;
  }

  #disk {
      color: @disk-color;
      border-top-color: @disk-color;
  }

  #idle_inhibitor {
      color: @idle-inhibitor-color;
      border-top-color: transparent;
  }

  #idle_inhibitor.activated {
      color: @idle-inhibitor-active-color;
      border-top-color: @idle-inhibitor-active-color;
  }

  #language {
      color: @niri-language-color;
      border-top-color: @niri-language-color;
  }

  #tray {
      background-color: transparent;
      padding: 0 10px;
      margin: 0 2px 0 2px;
      border-top-color: @foreground;
  }

  #tray>.passive {
      -gtk-icon-effect: dim;
  }

  #tray>.needs-attention {
      -gtk-icon-effect: highlight;
      color: @red;
      border-top-color: @red;
  }
''
