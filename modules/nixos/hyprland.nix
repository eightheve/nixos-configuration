{ pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts-monochrome-emoji

    nerd-fonts.jetbrains-mono

    hachimarupop
    migmix
    ];

    fontconfig.defaultFonts = {
    serif = [ "Noto Serif" "Noto Emoji"];
    sansSerif = [ "Sora" "MigMix 2P" "Noto Sans CJK SC" "Noto Emoji" ];
    monospace = [ "JetBrainsMono Nerd Font" "Noto Emoji"];
    emoji = ["Noto Emoji"];
    };
  };

  security.polkit.enable = true;

  # Essential services for Wayland/Hyprland
  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
      };
    };
  };

  # Required for screen sharing and some apps
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = with pkgs; [
    kitty
  ];
}
