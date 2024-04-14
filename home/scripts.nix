{ pkgs, ... }:
let
  maxfetch = pkgs.writeScriptBin "maxfetch" (builtins.readFile ./scripts/maxfetch.sh);
in {
  home.packages = [
    maxfetch
  ];
}
