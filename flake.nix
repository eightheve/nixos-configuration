{
  description = "Configuration for homelab and linked VPS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    gtk-nix.url = "github:the-argus/gtk-nix";
    flake-utils.url = "github:numtide/flake-utils";
    linger = {
      url = "github:mindsbackyard/linger-flake";
      inputs.flake-utils.follows = "flake-utils";
    };
    pihole = {
      url = "github:mindsbackyard/pihole-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.linger.follows = "linger";
    };
    vintagestory-nix = {
      url = "github:PierreBorine/vintagestory-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs = {
    nixpkgs,
    gtk-nix,
    linger,
    pihole,
    nixCats,
    nix-colors,
    home-manager,
    vintagestory-nix,
    ...
  }@inputs: {
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
                  ./users/sana/home-games.nix

                  ./modules/home-manager/hyprland/common
                  ./modules/home-manager/hyprland/PASSENGER

                  ./modules/home-manager/fish.nix
                  ./modules/home-manager/kitty.nix
                  ./modules/home-manager/supersonic.nix
                  ./modules/home-manager/xdg.nix
                  ./modules/home-manager/zed.nix
                  ./modules/home-manager/vesktop
                ];
              };
            };
          }
        ];
      };

      SATELLITE = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common.nix
          ./hosts/SATELLITE

          ./modules/nixos/sound.nix
          ./modules/nixos/hyprland.nix

          ./users/sana

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit nix-colors gtk-nix inputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sana = {
                imports = [
                  ./users/sana/home.nix
                  ./users/sana/home-gui.nix

                  ./modules/home-manager/hyprland/common
                  ./modules/home-manager/hyprland/SATELLITE

                  ./modules/home-manager/kitty.nix
                  ./modules/home-manager/xdg.nix
                  ./modules/home-manager/nixcats
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

          linger.nixosModules.x86_64-linux.default
          pihole.nixosModules.x86_64-linux.default

          ./modules/nixos/pihole.nix
          ./modules/nixos/wireguard/saotome+kazooie/saotome.nix

          ./users/sana

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit nix-colors; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sana = {
                imports = [
                  ./users/sana/home.nix
                ];
              };
            };
          }
        ];
      };
    };
  };
}
