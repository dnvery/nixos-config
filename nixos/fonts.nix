{ pkgs, ... }:
{
  fonts = {
    packages = [ (pkgs.callPackage ./apple-nerd-fonts.nix {}) ];

    fontconfig = {
      defaultFonts = {
        serif = [ "SFProDisplay Nerd Font" ];
        sansSerif = [ "SFProDisplay Nerd Font" ];
        monospace = [ "SFMono Nerd Font" ];
      };
    };
  };
}
