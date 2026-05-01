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
        gradient_count = 2;
        gradient_color_1 = "'#89b4fa'";
        gradient_color_2 = "'#94e2d5'";
      };

      smoothing = {
        monstercat = 1;
        waves = 0;
        noise_reduction = 77;
      };
    };
  };
}
