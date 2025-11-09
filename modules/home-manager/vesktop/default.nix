{ pkgs, config, ... }:

{
  imports = [
    ./theme.nix
  ];
  programs.css-theme = {
    enable = true;
    imports = [
      "https://raw.githubusercontent.com/imbypass/base16-discord/refs/heads/main/base16.css"
    ];
  };

  home.packages = with pkgs; [
    vesktop
  ];

  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
      checkUpdates = false;
      splashBackground = "#${config.colorScheme.palette.base00}";
      splashColor = "#${config.colorScheme.palette.base0A}";
      splashTheming = true;
    };
  };
}
