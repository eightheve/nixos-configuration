{ ... }:

{
  programs.beets = {
    enable = true;
    settings = {
      directory = "/srv/data/music/";
      import = {
        move = "yes";
      };
      original_date = "yes";

      plugins = [ "scrub" "musicbrainz" "lyrics" "lastgenre" "missing" "ftintitle" ];
      lastgenre = {
        count = 5;
        force = "yes";
        whitelist = "~/.config/beets/whitelist.txt";
        canonical = "yes";
      };
      ftintitle = {
        auto = "yes";
      };
      lyrics = {
        auto = "no";
      };
    };
  };
}
