{ pkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  users.users = {
    root.hashedPassword = "!"; # Disable root login
  };

  security.sudo.wheelNeedsPassword = false;

  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 2222 ];

  networking.firewall = {
    allowedUDPPortRanges = [ {
      from = 40000;
      to = 50000;
    } ];
    allowedTCPPortRanges = [ {
      from = 40000;
      to = 50000;
    } ];
  };

  services = {
    udisks2.enable = true;
    postfix = {
      enable = true;
      rootAlias = "sana";
      setSendmail = true;
    };
    openssh = {
      enable = true;
      ports = [ 22 2222 ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
  };

  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" "ja_JP.UTF-8/UTF-8" ];
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  environment.systemPackages = with pkgs; [
    mailutils
    fastfetch
    wget
    curl
    git
    nnn
  ];
}
