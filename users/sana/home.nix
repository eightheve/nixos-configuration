{ pkgs, ... }:

{
  home = {
    username = "sana";
    homeDirectory = "/home/sana";
  };

  programs = {
    git = {
      enable = true;
      userName = "doppelsana";
      userEmail = "sana@doppel.moe";
    };
    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
    };
  };

  home.packages = with pkgs; [
    home-manager

    unar
    xar
    file
    xxd
    python3
    python-qt

    flavours
    ffmpeg-full
  ];

  programs.fastfetch = {
    enable = true;
    settings = 
      let 
        greenKey = icon: {
          key = "  ${icon} ";
          keyColor = "green";
        };

        blueKey = icon: {
          key = "  ${icon} ";
          keyColor = "blue";
        };

        header = text: {
          type = "custom";
          color = "blue";
          format = text;
        };
      in {
        display.separator = " ";
        logo.padding.top = 0;

        modules = [
          (header "┌─── OS Information ──────────────────────────┐")
          "break"

          ({
            type = "title";
            color = { host = "green"; user = "green"; };
          } // greenKey "󰏩")

          ({ type = "os"; } // greenKey "󰇖")
          ({ type = "kernel"; } // greenKey "󰻀")
          ({ type = "packages"; } // greenKey "󱁤")
          ({ type = "shell"; } // greenKey "󰆍")
          ({ type = "uptime"; } // greenKey "󰔚")

          "break"
          (header "├─── Hardware Information ────────────────────┤")
          "break"

          ({ type = "host"; } // blueKey "󰌢")

          ({
            type = "cpu";
            format = "{packages} x {name}";
          } // blueKey "󰘚")

          {
            type = "cpu";
            key = "  └";
            keyColor = "blue";
            format = "{cores-physical} Cores ({cores-online} Threads) @ {freq-max}";
          }

          ({ type = "gpu"; } // blueKey "󰘚")
          ({ type = "memory"; } // blueKey "󰍛")
          ({ type = "disk"; } // blueKey "󱛟")

          "break"

          {
            type = "custom";
            keyColor = "blue";
            format = "└─────────────────────────────────────────────┘";
          }
        ];
      };
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}
