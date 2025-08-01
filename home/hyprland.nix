{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "wofi --show drun";

      exec-once = [ "swww-daemon &" "clash-verge" ];

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle";
        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.35;
          drag_lock = 0;
        };
      };

      device = {
        name = "mosart-semi.-mi-wireless-mouse-lite-mouse";
        accel_profile = "flat";
        sensitivity = 0.8;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.inactive_border" = "rgba(00000000)";
        "col.active_border" = "0xffc4a7e7";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          # vibrancy = 0.1696;
        };
      };

      xwayland = {
        force_zero_scaling = true;
      };

      windowrule = [
        "opacity 0.93, class:kitty|codium|firefox|obsidian"
        "opacity 1.0 override, title: (.*YouTube.*)"
        "opacity 1.0 override, fullscreen:1"
        # "opacity 1.0 override, title: (.*- ReYohoho.*)"
        "noshadow, focus:0"
      ];

      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, R, exec, $menu"
        "$mod, D, exec, rofi -show drun || pkill rofi"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        "$mod, L, exec, hyprlock"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
    };
  };
}
