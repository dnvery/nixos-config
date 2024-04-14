{ config, pkgs, ... }: 
{
  services = {
    mako = {
      enable = true;
      font = "SFMono Nerd Font 10";
      defaultTimeout = 5000;
      borderSize = 2;
      borderRadius = 5;
      backgroundColor = "#1e1e2e";
      borderColor = "#b4befe";
      progressColor = "over #313244";
      textColor = "#cdd6f4";
      icons = true;
      actions = true;
      extraConfig = ''
        [urgency=high]
        border-color=#fab387
      '';
    };
  };
}
