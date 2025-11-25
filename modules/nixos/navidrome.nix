{ pkgs, ... }:

{
  users.users.navidrome = {
    isSystemUser = true;
    group = "navidrome";
    home = "/var/lib/navidrome";
    createHome = true;
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
