{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 90;
        bar_width = 3;
      };
      output = {
        channels = "mono";
      };
      color = {
        gradient = 1;
        gradient_count = 2;
        gradient_color_1 = "'#89b4fa'";
        gradient_color_2 = "'#94e2d5'";
      };
    };
  };
}
