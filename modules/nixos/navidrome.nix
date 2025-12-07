{ pkgs, ... }:

{
  users.users.navidrome = {
    isSystemUser = true;
    group = "navidrome";
    home = "/var/lib/navidrome";
    createHome = true;
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    
    virtualHosts."navi.doppel.moe" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:4533";
        proxyWebsockets = true;
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "sana@doppel.moe";
  };

  services.navidrome = {
    enable = true;
    user = "navidrome";
    group = "navidrome";
    openFirewall = true;
    environmentFile = "/var/lib/navidrome/.env";
    settings = {
      MusicFolder = "/srv/data/music";
      AlbumPlayCountMode = "normalized";
      "Tags.Genre.Split" = [ "," ";" ];
      EnableSharing = true;
    };
  };
}
