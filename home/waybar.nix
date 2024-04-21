{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
#      mode = "dock";
      height = 30;

      modules-left = [
        "clock"
        "hyprland/workspaces"
      ];

      modules-right = [
        "tray"
        "hyprland/language"
        "network"
        "bluetooth"
        "temperature"
        "memory"
        "cpu"
        "battery"
        "pulseaudio"
        "backlight"
      ];

      "hyprland/language" = {
        "format-en" = "en";
        "format-ru" = "ru";
      };

      "hyprland/workspaces" = {
        "disable-scroll" = true;
        "all-outputs" = true;
        "on-click" = "activate";
        "format" = "{icon}";
        "format-icons" = {
          "default" = "";
        };
        "persistent-workspaces" = {
          "*" = 4;
        };
      };

      "tray" = {
        "icon-size" = 18;
        "spacing" = 10;
      };

      "clock" = {
        "format" = " {:%H:%M}";
        "tooltip-format" = "<tt><small>{calendar}</small></tt>";
      };

      "battery" = {
        "states" = {
          "warning" = 20;
          "critical" = 10;
        };
        "format" = "{icon} {capacity}%";
        "format-charging" = " {capacity}%";
        "format-plugged" = " {capacity}%";
        "format-alt" = "{icon} {time}";
        "format-icons" = ["" "" "" "" ""];
        "interval" = 3;
      };

      "pulseaudio" = {
        "format" = "{icon} {volume}%";
        "tooltip" = true;
        "format-muted" = "";
        "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "on-click-right" = "pavucontrol";
        "on-scroll-up" = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
        "on-scroll-down" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "scroll-step" = 5;
        "smooth-scrolling-threshold" = 3.0;
        "format-icons" = {
          "headphone" = "";
          "hands-free" = "";
          "headset" = "";
          "phone" = "";
          "portable" = "";
          "car" = "";
          "default" = ["􀊥" "􀊧" "􀊩"];
        };
      };

      "pulseaudio#microphone" = {
        "format" = "{format_source}";
        "format-source" = " {volume}%";
        "format-source-muted" = " Muted";
        "on-click" = "pamixer --default-source -t";
        "on-scroll-up" = "pamixer --default-source -i 5";
        "on-scroll-down" = "pamixer --default-source -d 5";
        "scroll-step" = 5;
      };

      "temperature" = {
        "thermal-zone" = 0;
        "format" = " {temperatureC}°C";
        "critical-threshold" = 80;
      };

      "memory" = {
        "interval" = 30;
        "format" = " {}%";
        "max-length" = 10;
        "tooltip" = true;
        "tooltip-format" = "Memory - {used =0.1f}GB used";
        "on-click" = "alacritty -e htop";
      };

      "cpu" = {
        "format" = " {usage}%";
      };

      "network" = {
        "format-wifi" = " {signalStrength}%";
        "tooltip-format" = "{essid} - {ifname} via {gwaddr}";
        "format-linked" = "{ifname} (No IP)";
        "format-disconnected" = "󰀦 none";
        "format-alt" = "{ifname} ={essid} {ipaddr}/{cidr}";
      };

      "bluetooth" = {
        "format" = " {status}";
        "format-disabled" = "";
        "format-connected" = " {device_alias}";
        "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
        "tooltip-format" = "{device_alias}";
        "tooltip-format-connected" = " {device_enumerate}";
        "tooltip-format-enumerate-connected" = "{device_alias}";
        "on-click-right" = "blueman-manager";
      };

      "backlight" = {
        "device" = "intel_backlight";
        "format" = "{icon} {percent}%";
        "format-icons" = ["󰛩" "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
        "smooth-scrolling-threshold" = 3.0;
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "SFMono Nerd Font";
        font-weight: bold;
        font-size: 13px;
        min-height: 0;
      }

    window#waybar {
      background: rgba(21, 18, 27, 0);
      color: #cdd6f4;
    }

    tooltip {
      background: #313244;
      border-radius: 8px;
      border: none;
    }

    #workspaces button {
      padding: 5px;
      padding-right: 10px;
      color: #403d52;
      margin-left: 2px;
      margin-right: 2px;
    }

    #workspaces button.active {
      color: #cdd6f4;
    }

    #workspaces button.focused {
      color: #908caa;
      background: #eb6f92;
      border-radius: 6px;
    }

    #workspaces button.urgent {
      color: #1e1e2e;
      background: #31748f;
      border-radius: 6px;
    }

    #workspaces button:hover {
      background: #21202e;
      color: #e0def4;
      border-radius: 6px;
    }

    #custom-power_profile,
    #window,
    #clock,
    #battery,
    #pulseaudio,
    #network,
    #language,
    #bluetooth,
    #temperature,
    #workspaces,
    #tray,
    #memory,
    #cpu,
    #backlight {
      background: #1e1e2e;
      opacity: 0.9;
      padding: 0px 10px;
      margin: 0px 0px;
      margin-top: 10px;
      border: 2px solid #1e1e2e;
    }

    #cpu {
      color: #74c7ec;
    }

    #bluetooth {
      color: #94e2d5;
    }

    #memory {
      color: #fab387;
    }

    #temperature {
      color: #f6c177;
    }

    #temperature.critical {
      color: #eb6f92;
    }

    #backlight {
      color: #f5e0dc;
      border-radius: 0px 8px 8px 0px;
      margin-right: 20px;
      border-left: 0px;
    }

    #tray {
      border-radius: 8px;
      margin-right: 10px;
    }

    #workspaces {
      background: #1e1e2e;
      border-radius: 8px;
      margin-left: 10px;
      padding-right: 0px;
      padding-left: 0px;
    }

    #clock {
      color: #cdd6f4;
      border-radius: 8px;
      margin-left: 20px;
    }

  #network {
      color: #eba0ac;
      border-radius: 8px 0px 0px 8px;
    }

    #language {
      color: #f5c2e7;
      border-radius: 8px;
      margin-right: 10px;
    }

    #pulseaudio {
      color: #cba6f7;
      border-radius: 8px 0px 0px 8px;
    }

    #battery {
      color: #a6e3a1;
      border-radius: 0px 8px 8px 0px;
      margin-right: 10px;
    }

    #battery.discharging.warning {
      color: #f9e2af;
    }

    #battery.discharging.critical {
      color: #f38ba8;
    }
    '';
  };
}
