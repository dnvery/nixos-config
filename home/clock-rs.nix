{
  programs.clock-rs = {
    enable = true;
    settings = {
      general = {
        color = "magenta";
        interval = 250;
        bold = true;
      };

      date = {
        fmt = "%A, %B %d, %Y";
        # hide_seconds = true;
      };
    };
  };
}