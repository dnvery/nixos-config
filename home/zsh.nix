{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
    };
    shellAliases = {
      c = "clear";
      update = "sudo nixos-rebuild switch --flake ~/nixos-config";
      flake-update = "sudo nix flake update ~/nixos-config";
    };
  };
}
