{ lib, pkgs, ... }:
{
  programs.nixvim = {
    plugins.nvim-jdtls = {
      enable = true;
      cmd = [
        (lib.getExe pkgs.jdt-language-server)
      ];
    };

    plugins.lsp = {
      enable = true;
      servers = {
        lua-ls = { enable = true; };
        java-language-server = { enable = true; };
        nil_ls = { enable = true; }; # Nix
        html = { enable = true; };
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
  };
}
