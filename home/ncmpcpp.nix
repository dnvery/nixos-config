{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Syncthing/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
  programs.ncmpcpp.enable = true;
}
