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

      plugins = "scrub missing ftintitle";
      ftintitle = {
        auto = "yes";
      };
    };
  };
}
