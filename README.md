# EighthEve's NixOS Configuration(s)

Multi-host NixOS flake configuration. Will forever be a work in progress, but is especially WIP right now.

## Directory Structure
- `common.nix`: shared configuration across all systems (SSH, i18n, base packages, etc.)
- `hosts/`: per-host system configs (`default.nix`, `hardware.nix`)
- `users/`: per-user definitions
	+ `users/[username]/default.nix`: system level configuration
	+ `users/[username]/home.nix`: Home Manager configuration (packages, themes, nix-colors)
- `modules/`: standalone reusable modules
	+ `modules/nixos/`: system-level modules
	+ `modules/home-manager/`: Home Manager modules

## Hosts

### ACTIVE
| Host      | Role                | Location    | Model        |
| :-------- | :-----------------: | :---------: | :----------: |
| PASSENGER | Desktop/Workstation | Home        | Custom Build |
| SAOTOME   | Home Server/NAS     | Home        | Dell R720    |
| KAZOOIE   | Proxy for SAOTOME   | VA (VPS)    | N/A          |

### INACTIVE
| Host      | Role                | Location    | Model                   |
| :-------- | :-----------------: | :---------: | :---------------------: |
| BANJO     | Future Pi-hole host | Home        | ThinkCentre M715Q       |
| NYANKO    | Spare, no plans yet | Home        | HP ProLiant DL360P Gen8 |
| TOMOCCHI  | Spare, no plans yet | Home        | HP ProLiant DL360P Gen8 |
| HAMUKO    | Spare, no plans yet | Home        | HP ProLiant DL360P Gen8 |

## To-Do
- [ ] Move Pi-hole to BANJO
- [ ] Install network switch (Required for spares)
- [ ] Vintagestory server hosting for Runovaris
- [ ] Minecraft server hosting for me
- [ ] Mail server setup
- [ ] Replace wireguard with DDNS (?)
- [ ] Migrate navidrome + SLSKD stack to SAOTOME
- [ ] Configure backup host for SAOTOME (possibly HP spare)