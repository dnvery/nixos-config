{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, Q, exec, kitty"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        "$mod, T, togglefloating,"
        "$mod, V, exec, noctalia-shell ipc call launcher clipboard"
        "$mod, R, exec, noctalia-shell ipc call launcher toggle"
        "$mod, L, exec, noctalia-shell ipc call lockScreen lock"
        "$mod, P, pseudo, # dwindle"
        "$mod, J, togglesplit, # dwindle"

        # Screenshot bindings
        ", Print, exec, grimblast --freeze --notify copysave area ~/Pictures/Screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png"
        "SHIFT, Print, exec, grimblast --notify save area ~/Pictures/Screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png"
        "CTRL, Print, exec, grimblast --freeze --notify copysave screen ~/Pictures/Screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png"

        # Move focus with mod + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Switch workspaces with mod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
        # Move/resize windows with mod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        # Volume controls
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        # Brightness controls
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];

      bindl = [
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      monitor = [
        ",preferred,auto,auto"
      ];

      exec-once = [
        "noctalia-shell"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(cba6f7ee) rgba(b4befeee) 45deg";
        "col.inactive_border" = "rgba(6c7086aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle";
        touchpad = {
          natural_scroll = true;
        };
      };

      xwayland = {
        force_zero_scaling = true;
      };

      env = [
        #"GDK_SCALE,2"
        "XCURSOR_SIZE,24"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      ];

      windowrule = [
        {
          name = "librewolf-opacity";
          match.class = "^(librewolf)$";
          opacity = [ 0.90 0.90 ];
        }
        {
          name = "firefox-opacity";
          match.class = "^(firefox)$";
          opacity = [ 0.90 0.90 ];
        }
        {
          name = "kitty-opacity";
          match.class = "^(kitty)$";
          opacity = [ 0.85 0.85 ];
        }
        {
          name = "obsidian-opacity";
          match.class = "^(obsidian)$";
          opacity = [ 0.90 0.90 ];
        }
        {
          name = "telegram-opacity";
          match.class = "^(org.telegram.desktop)$";
          opacity = [ 0.90 0.90 ];
        }
        {
          name = "vscodium-opacity";
          match.class = "^(codium)$";
          opacity = [ 0.90 0.90 ];
        }
        {
          name = "no-blur-fullscreen";
          match.fullscreen = true;
          opacity = [ 1.0 1.0 ];
        }
      ];
    };
  };
}
