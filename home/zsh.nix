{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      c = "clear";
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake ~/nixos-config --option cores 6 --option max-jobs 4";
    };
  };
}
