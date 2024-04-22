{ pkgs, ... }:
let
  maxfetch = pkgs.writeScriptBin "maxfetch" (builtins.readFile ./maxfetch.sh);
in {
  home.packages = [
    maxfetch
  ];
}
