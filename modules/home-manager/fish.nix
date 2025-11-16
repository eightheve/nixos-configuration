{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      la = "ls -la";
      ".." = "cd ..";
      kssh = "kitten ssh";
    };
  };
}
