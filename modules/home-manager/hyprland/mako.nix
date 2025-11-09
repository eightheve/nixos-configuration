{ config, ...}:

{
  services.mako = {
    enable = true;
    settings = {
      on-button-left = "invoke-default-action";
      on-button-right = "dismiss";

      output = "HDMI-A-1";

      border-radius = 10;
      padding = "8";
      icon-border-radius = 8;
      default-timeout = 10000;
      outer-margin= 12;

      font = "Sora 10";
      background-color = "#${config.colorScheme.palette.base01}";
      text-color = "#${config.colorScheme.palette.base0E}";
      border-color = "#${config.colorScheme.palette.base00}";
    };
  };
}
