{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # deployable via `sudo nixos-rebuild switch --flake .#pc` etc...
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" ];
      pkgsFor = lib.genAttrs systems (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );
    in
    {
      inherit lib;
      homeManagerModules = import ./modules/home-manager;
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/laptop/laptop.nix
            ./hosts/laptop/configuration.nix
            ./hosts/laptop/hardware-configuration.nix
            ./modules/common.nix
            ./modules/git.nix
            ./modules/htop.nix
            ./modules/steam.nix
            ./modules/syncthing.nix
          ];
        };

        pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/pc/pc.nix
            ./hosts/pc/configuration.nix
            ./hosts/pc/hardware-configuration.nix
            ./modules/common.nix
            ./modules/git.nix
            ./modules/htop.nix
            ./modules/nvidia.nix
            ./modules/steam.nix
            inputs.home-manager.nixosModules.default
          ];
          extraSpecialArgs = { inherit inputs outputs; };
        };

        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/wsl/wsl.nix
            ./hosts/wsl/configuration.nix
            ./modules/common.nix
            ./modules/git.nix
            ./modules/htop.nix
          ];
        };
      };

      homeConfigurations = {
        "colm@leo" = lib.homeManagerConfigurations {
          modules = [
            ./home/colm/pc.nix
          ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    };
}
