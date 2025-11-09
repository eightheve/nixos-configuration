{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      sana-rebuild = "sudo nixos-rebuild switch --flake /home/sana/.nix#PASSENGER";
      la = "ls -la";
      ".." = "cd ..";
      kssh = "kitten ssh";
    };
  };
}
