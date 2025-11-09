{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.css-theme;

  themeCSS = pkgs.writeText "autotheme.css" ''
    /**
    * @name base16NixAuto
    * @author @parchedocean
    * @version 0.1.0
    * @description Based on a theme by @bypass_
    **/

    ${optionalString (cfg.imports != [])
      (concatMapStringsSep "\n" (url: "@import url(\"${url}\");") cfg.imports)}

    :root {
        --base00: ${cfg.colors.base00};
        --base01: ${cfg.colors.base01};
        --base02: ${cfg.colors.base02};
        --base03: ${cfg.colors.base03};
        --base04: ${cfg.colors.base04};
        --base05: ${cfg.colors.base05};
        --base06: ${cfg.colors.base06};
        --base07: ${cfg.colors.base07};
        --base08: ${cfg.colors.base08};
        --base09: ${cfg.colors.base09};
        --base0A: ${cfg.colors.base0A};
        --base0B: ${cfg.colors.base0B};
        --base0C: ${cfg.colors.base0C};
        --base0D: ${cfg.colors.base0D};
        --base0E: ${cfg.colors.base0E};
        --base0F: ${cfg.colors.base0F};
    }
  '';
in
{
  options.programs.css-theme = {
    enable = mkEnableOption "CSS theme generation";

    imports = mkOption {
      type = types.listOf types.str;
      default = [];
      description = "CSS imports (URLs or paths)";
      example = [ "https://example.com/theme.css" "base.css" ];
    };

    colors = mkOption {
      type = types.submodule {
        options = {
          base00 = mkOption { type = types.str; default = "#${config.colorScheme.palette.base01}"; };
          base01 = mkOption { type = types.str; default = "#1d1829"; };
          base02 = mkOption { type = types.str; default = "#1d1829"; };
          base03 = mkOption { type = types.str; default = "#898790"; };
          base04 = mkOption { type = types.str; default = "#898790"; };
          base05 = mkOption { type = types.str; default = "#${config.colorScheme.palette.base0E}"; };
          base06 = mkOption { type = types.str; default = "#${config.colorScheme.palette.base0E}"; };
          base07 = mkOption { type = types.str; default = "#${config.colorScheme.palette.base07}"; };
          base08 = mkOption { type = types.str; default = "#${config.colorScheme.palette.base0A}"; };
          base09 = mkOption { type = types.str; default = "#${config.colorScheme.palette.base06}"; };
          base0A = mkOption { type = types.str; default = "#${config.colorScheme.palette.base0A}"; };
          base0B = mkOption { type = types.str; default = "#${config.colorScheme.palette.base04}"; };
          base0C = mkOption { type = types.str; default = "#${config.colorScheme.palette.base0B}"; };
          base0D = mkOption { type = types.str; default = "#1d1829"; };
          base0E = mkOption { type = types.str; default = "#${config.colorScheme.palette.base04}"; };
          base0F = mkOption { type = types.str; default = "#${config.colorScheme.palette.base06}"; };
        };
      };
      default = {};
      description = "Color scheme";
    };

    outputPath = mkOption {
      type = types.str;
      default = ".config/vesktop/themes/base16NixAuto.css";
      description = "Output path relative to home directory";
    };
  };

  config = mkIf cfg.enable {
    home.file."${cfg.outputPath}".source = themeCSS;
  };
}
