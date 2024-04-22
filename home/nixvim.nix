{ lib, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
    plugins.lsp = {
      enable = true;
      servers = {
        lua-ls = { enable = true; };
        java-language-server = { enable = true; };
        nil_ls = { enable = true; }; # Nix
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    plugins.neo-tree.enable = true;
    plugins.nvim-jdtls = {
      enable = true;
      cmd = [
        (lib.getExe pkgs.jdt-language-server)
      ];
    };
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>fg" = "live_grep";
      };
      extensions = {
        ui-select.enable = true;
        fzf-native.enable = true;
      };
    };
    plugins.cmp-nvim-lsp.enable = true;
    plugins.cmp = {
      enable = true;
      settings = {
      sources = [
       # TODO activate when nvim-lsp is working
       { name = "nvim_lsp"; }
      ];
      window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          };
          documentation = {
            border = "rounded";
          };
        };
      };
      #autoEnableSources = true;
    };
    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<C-b>";
        mode = "n";
        options = {
          desc = "Toggle Tree View.";
        };
      }
    ];
    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      smartindent = true;
      shiftwidth = 2;

      breakindent = true;
    };
  };
}
