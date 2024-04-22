{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./lualine.nix
    ./lsp.nix
    ./options.nix
    ./telescope.nix
    ./cmp.nix
    ./neo-tree.nix
    ./catppuccin.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
  };
}
