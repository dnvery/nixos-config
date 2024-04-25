{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "hyprpaper"
        "waybar"
        "firefox"
      ];

      xwayland.force_zero_scaling = true;

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.3;
        };
        sensitivity = 0.08;
      };

      device = {
        name = "a4tech-usb-device";
        accel_profile = "flat";
        sensitivity = 0.35;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgb(b4befe)";
        "col.inactive_border" = "rgb(6c7086)";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 2;
          passes = 3;
        };
      };

      misc.force_default_wallpaper = 0;

      gestures.workspace_swipe = true;
        
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$browser" = "firefox";
      "$menu" = "wofi --show drun";

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, B, exec, $browser"
        "$mainMod, F, fullscreen,"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

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

        "$mainMod, Print, exec, grimblast --notify --cursor save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        ", PRINT, exec, grimblast save"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [        
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      env = [
        "XCURSOR_SIZE,20"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "GDK_SCALE,2"
      ];
    };
    extraConfig = "
monitor=,preferred,auto,auto

source = ~/.config/hypr/mocha.conf

windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.

bind = ALT, R, submap, resize

submap=resize

binde =, right, resizeactive, 10 0
binde =, left, resizeactive, -10 0
binde =, up, resizeactive, 0 -10
binde =, down, resizeactive, 0 10

bind =, escape, submap, reset

submap=reset

# keybinds further down will be global again...
    ";
  };
}
