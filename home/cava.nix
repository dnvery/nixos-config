{ pkgs, ... }:

{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        mode = "normal";
        framerate = 90;
        bars = 0;
        bar_width = 3;
        bar_spacing = 1;
      };

      input = {
        method = "pipewire";
      };

      output = {
        method = "ncurses";
        channels = "mono";
      };

      color = {
        gradient = 1;
        gradient_count = 6;
        gradient_color_1 = "'#cba6f7'"; # Mauve
        gradient_color_2 = "'#f5c2e7'"; # Pink
        gradient_color_3 = "'#f38ba8'"; # Red
        gradient_color_4 = "'#fab387'"; # Peach
        gradient_color_5 = "'#f9e2af'"; # Yellow
        gradient_color_6 = "'#a6e3a1'"; # Green
      };

      smoothing = {
        monstercat = 1;
        waves = 0;
        noise_reduction = 77;
      };
    };
  };
}
