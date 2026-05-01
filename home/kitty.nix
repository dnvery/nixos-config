{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "rose-pine-moon";

    settings = {
      window_padding_width = 10;
    };
  };
}
