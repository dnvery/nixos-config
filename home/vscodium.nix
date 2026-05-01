{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        mvllow.rose-pine
        bbenoist.nix
      ];
      userSettings = {
        "window.titleBarStyle" = "custom";
        "editor.minimap.enabled" = false;
        "editor.stickyScroll.enabled" = false;
        "workbench.colorTheme" = "Rosé Pine";
      };
    };
  };
}
