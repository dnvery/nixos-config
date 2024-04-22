{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<C-b>";
      mode = "n";
      options = {
        desc = "Toggle Tree View.";
      };
    }
  ];
}
