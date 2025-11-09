{ gtk-nix, pkgs, ... }:

{
  imports = [ gtk-nix.homeManagerModule ];

  home.packages = with pkgs; [
    lxappearance
  ];

  qt = {
    enable = true;
    #  platformTheme.name = "gtk";
  };

  gtkNix = {
    enable = true;
    #whites =
    #  let
    #    mkWhite = alpha: "#${config.colorScheme.palette.base0E}${alpha}";
    #  in
    #  {
    #    strongest = mkWhite "FF";
    #    strong = mkWhite "DE";
    #    moderate = mkWhite "57";
    #    weak = mkWhite "24";
    #    weakest = mkWhite "0F";
    #  };
    #blacks =
    #  let
    #    mkBlack = alpha: "#${config.colorScheme.palette.base01}${alpha}";
    #  in
    #  {
    #    strongest = mkBlack "FF";
    #    strong = mkBlack "DE";
    #    moderate = mkBlack "6B";
    #    weak = mkBlack "26";
    #    weakest = mkBlack "0F";
    #  };

    palette = rec {
      base00 = "070b13"; # BACKGROUND
      base01 = "161b23"; # LIGHT BACKGROUND
      base02 = "3f434a"; # SELECTION
      base03 = "5f6368"; # COMMENTS
      base04 = "cccdcd"; # DARK FOREGROUND
      base05 = "f3f3f1"; # FOREGROUND
      base06 = "a6a8aa"; # LIGHT FOREGROUND
      base07 = "a6a8aa"; # LIGHT BACKGROUND
      base08 = "e03742"; # RED
      base09 = "3fb68f"; # LIME
      base0A = "eba254"; # YELLOW
      base0B = "936db5"; # BLUE
      base0C = "f34467"; # FUSCHIA
      base0D = "5b9ae8"; # AQUA
      base0E = "b4304b"; # PURPLE
      base0F = "a62730"; # MAROON

      highlight = base0E;
      hialt0 = base0A;
      hialt1 = base0E;
      hialt2 = base0B;
      urgent = base08;
      warn = base0A;
      confirm = base09;
      link = base0D;

      pfg-highlight = base00;
      pfg-hialt0 = base00;
      pfg-hialt1 = base00;
      pfg-hialt2 = base00;
      pfg-urgent = base00;
      pfg-warn = base00;
      pfg-confirm = base00;
      pfg-link = base00;
    };
  };
}
