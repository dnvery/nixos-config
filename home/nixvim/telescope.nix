{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>fg" = "live_grep";
    };
    extensions = {
      ui-select.enable = true;
      fzf-native.enable = true;
    };
  };
}
