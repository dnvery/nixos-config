{ inputs, pkgs, ... }: 
{
  programs.cava = {
    enable = true;  
  };
  
  home.file.".config/cava/config".text = ''
[general]
framerate = 90
sensitivity = 70
bar_width = 2

[output]
channels = mono

[color]
gradient = 1
gradient_count = 2
gradient_color_1 = '#89b4fa'
gradient_color_2 = '#94e2d5'
  '';
}
