{ inputs, ... }:
{
  programs.hyprpanel = {
    enable = true;
    settings = {
      bar.layouts = {
        "*" = {
          left = [ "dashboard" "workspaces" ];
          right = [ "volume" "network" "bluetooth" "battery" "systray" "clock" "notifications" ];
        };
      };

      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;

      scalingPriority = "hyprland";

      theme.bar = {
        buttons.y_margins = "0.4em";
        transparent = true;
        scaling = 70;
        border_radius = "0.8em";
        buttons.radius = "0.8em";
        # margin_sides = "0.2em";
        # buttons.padding_x = "0.3rem";
        outer_spacing = "0.8em";
        menus = {
          menu = {
            battery.scaling = 70;
            bluetooth.scaling = 70;
            clock.scaling = 70;
            dashboard.confirmation_scaling = 70;
            dashboard.scaling = 70;
            media.scaling = 70;
            network.scaling = 70;
            notifications.scaling = 70;
            power.scaling = 70;
            volume.scaling = 70;
          };
          popover.scaling = 70;
        };
      };

      theme.font = {
        name = "Maple Mono NF";
        size = "16px";
      };

      theme.notification.scaling = 70;
      theme.osd.scaling = 70;
      theme.tooltip.scaling = 70;

      bar.workspaces.workspaces = 5;
      bar.workspaces.monitorSpecific = false;

      bar.clock.format = "%H:%M";
    };
  };
}