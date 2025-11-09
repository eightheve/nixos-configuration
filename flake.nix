{
  description = "Configuration for homelab and linked VPS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-colors.url = "github:misterio77/nix-colors";
    gtk-nix.url = "github:the-argus/gtk-nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vintagestory-nix = {
      url = "github:PierreBorine/vintagestory-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    gtk-nix,
    nix-colors,
    home-manager,
    vintagestory-nix,
    ...
  }: {
    nixosConfigurations = {
      PASSENGER = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common.nix
          ./hosts/PASSENGER

          ./modules/nixos/lain-grub
          ./modules/nixos/hyprland.nix
          ./modules/nixos/sound.nix

          ./users/sana

          {
            nixpkgs.overlays = [vintagestory-nix.overlays.default];
          }

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit nix-colors gtk-nix; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sana = {
                imports = [
                  ./users/sana/home.nix
                  ./users/sana/home-gui.nix

                  ./modules/home-manager/vesktop
                  ./modules/home-manager/hyprland
                  ./modules/home-manager/fish.nix
                  ./modules/home-manager/kitty.nix
                  ./modules/home-manager/supersonic.nix
                  ./modules/home-manager/xdg.nix
                  ./modules/home-manager/zed.nix
                ];
              };
            };
          }
        ];
      };

      BANJO = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common.nix
          ./hosts/BANJO

          ./users/sana
        ];
      };

      KAZOOIE = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common.nix
          ./hosts/KAZOOIE

          ./modules/nixos/wireguard/saotome+kazooie/kazooie.nix

          ./users/sana
        ];
      };

      SAOTOME = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common.nix
          ./hosts/SAOTOME

          ./modules/nixos/wireguard/saotome+kazooie/saotome.nix

          ./users/sana
        ];
      };
    };
  };
}
