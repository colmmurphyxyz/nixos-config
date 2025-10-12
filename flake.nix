{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ...}@inputs: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/laptop/laptop.nix
          ./hosts/laptop/configuration.nix
          ./hosts/laptop/hardware-configuration.nix
          ./modules/common.nix
          ./modules/steam.nix
          ./modules/syncthing.nix
        ];
      };

      pc = nixpkgs.lib.nixosSysten {
        system = "x86_64-linux";
        modules = [
          ./hosts/pc/pc.nix
          ./hosts/pc/configuration.nix
          ./hosts/pc/hardware-configuration.nix
          ./modules/common.nix
          ./modules/steam.nix
        ];
      };

      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/wsl/wsl.nix
          ./hosts/wsl/configuration.nix
          ./modules/common.nix
        ];
      };
    };
  };
}

