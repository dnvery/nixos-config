{
  programs.nixvim = {
    plugins.cmp-nvim-lsp.enable = true;

    plugins.cmp = {
      enable = true;
      settings = {
        sources = [
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
    };
  };
}
