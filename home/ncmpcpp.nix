{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Downloads";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
  programs.ncmpcpp.enable = true;
}