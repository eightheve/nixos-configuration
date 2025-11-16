{ config, ...}:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        height = 36;
        layer = "top";
        position = "top";
        margin = "8 8 0";
        spacing = 8;
        output = "DP-2";
        modules-left = [
          "cpu"
          "hyprland/workspaces"
        ];
        modules-center = [
          "custom/waybar-mpris"
        ];
        modules-right = [
          "clock#time"
          "clock#date"
          "pulseaudio"
        ];
        "pulseaudio" = {
          format = "{volume}% {icon}";
          max-volume = 100;
          scroll-step = 1;
          format-icons = {
            default = "";
            default-muted = "";
          };
          on-click = "pavucontrol";
        };
        "hyprland/workspaces" = {
          format = "{id}: {icon}";
          format-icons = {
            default = "󰍹";
            active = "󱩛";
          };
        };
        "custom/waybar-mpris" = {
          return-type = "json";
          escape = true;
          exec = "waybar-mpris --pause '' --play ''";
          on-click = "waybar-mpris --send toggle";
          on-scroll-up = "waybar-mpris --send next";
          on-scroll-down = "waybar-mpris --send prev";
        };
        "clock#time" = {
            interval = 1;
            tooltip = true;
            format = "{:%H:%M}";
            tooltip-format = "{:%T}";
        };
        "clock#date" = {
            interval = 60;
            tooltip = true;
            format = "{:%a %d }";
            tooltip-format = "{:%Y-%m-%d}";
        };
        cpu = {
          interval = 5;
          format = "{usage}% ";
        };
      };
    };
    style = ''
      *{
        font-family: "JetBrainsMono Nerd Font";
        font-weight: bold;
        font-size: 14px;
        color: #${config.colorScheme.palette.base0E};
      }

      .modules-right {
        padding-right: 8px;
      }
      .modules-left {
        padding-left: 8px;
      }

      window {
        background-color: #${config.colorScheme.palette.base01};
        border-radius: 10px;
      }

      .module {
        padding: 0 8px;
      }

      #pulseaudio-slider {
        min-width: 128px;
        padding: 0 12px;
      }
      #pulseaudio-slider slider {
        min-width: 8px;
      }
      #pulseaudio-slider trough {
        background-color: #${config.colorScheme.palette.base0F};
      }
      #pulseaudio-slider highlight {
        background-color: #${config.colorScheme.palette.base0E};
      }

      #clock { min-width: 48px; }
      #idle_inhibitor { min-width: 24px; padding: 0 7px 0 0; }
      #cpu { min-width: 34px; }
      #memory { min-width: 34px; }
      #temperature { min-width: 34px; }
      #custom-waybar-mpris { min-width: 128px; }
    '';
  };
}
