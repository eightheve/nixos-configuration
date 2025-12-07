{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    supersonic
  ];

  # THEME
  home.file.".config/supersonic/themes/madoka.toml".text = ''
    [SupersonicTheme]
    Name = "Madoka"
    Version = "0.2"
    SupportsDark = true
    SupportsLight = false

    [DarkColors]
    PageBackground = "#${config.colorScheme.palette.base01}"
    ListHeader = "#${config.colorScheme.palette.base00}"
    PageHeader = "#${config.colorScheme.palette.base00}"
    Background = "#${config.colorScheme.palette.base00}"
    ScrollBar = "#${config.colorScheme.palette.base0F}"
    Button = "#${config.colorScheme.palette.base0A}32"
    Foreground = "#${config.colorScheme.palette.base0E}"
    InputBackground = "#${config.colorScheme.palette.base00}32"
    HyperLink = "#${config.colorScheme.palette.base0A}"

    #Primary = "#${config.colorScheme.palette.base0A}"
  '';

  # FONTS
  # home.file.".config/supersonic/fonts/SarasaUiCL-Regular.ttf".source = "${config.home.homeDirectory}/.assets/SarasaUiCL-Regular.ttf";
  # home.file.".config/supersonic/fonts/SarasaUiCL-Bold.ttf".source = "${config.home.homeDirectory}/.assets/SarasaUiCL-Bold.ttf";
}
