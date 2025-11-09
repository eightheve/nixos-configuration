{ config, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      foreground = "#${config.colorScheme.palette.base0E}";
      background = "#${config.colorScheme.palette.base01}";
      selection_foreground = "#${config.colorScheme.palette.base01}";
      selection_background = "#${config.colorScheme.palette.base0E}";

      cursor = "#${config.colorScheme.palette.base07}";
      cursor_text_color = "background";

      color0 =  "#${config.colorScheme.palette.base01}";  # Grey
      color1 =  "#${config.colorScheme.palette.base03}";  # Red
      color2 =  "#${config.colorScheme.palette.base05}";  # Green
      color3 =  "#${config.colorScheme.palette.base07}";  # Yellow
      color4 =  "#${config.colorScheme.palette.base09}";  # Blue
      color5 =  "#${config.colorScheme.palette.base0B}";  # Magenta
      color6 =  "#${config.colorScheme.palette.base0D}";  # Cyan
      color7 =  "#${config.colorScheme.palette.base0F}";  # White

      # Bright colors
      color8 =  "#${config.colorScheme.palette.base00}";  # Bright Grey (Black)
      color9 =  "#${config.colorScheme.palette.base02}";  # Bright Red
      color10 = "#${config.colorScheme.palette.base04}";  # Bright Green
      color11 = "#${config.colorScheme.palette.base06}";  # Bright Yellow
      color12 = "#${config.colorScheme.palette.base08}";  # Bright Blue
      color13 = "#${config.colorScheme.palette.base0A}";  # Bright Magenta
      color14 = "#${config.colorScheme.palette.base0C}";  # Bright Cyan
      color15 = "#${config.colorScheme.palette.base0E}";  # Bright White

      mouse_hide_wait = "-1";
      window_padding_width = "0 12 8";
    };
  };
}
