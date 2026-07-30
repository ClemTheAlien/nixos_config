{
  description = "ClemTheAlien's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowc = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    exfetch = {
      url = "git+https://codeberg.org/Izder456/exfetch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      mangowc,
      exfetch,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      specialArgs = { inherit inputs; };
    in
    {
      nixosConfigurations = {
        themojave = nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            ./hosts/themojave
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
            inputs.mangowc.nixosModules.mango
            home-manager.nixosModules.home-manager
          ];
        };

        blackmesa = nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            ./hosts/blackmesa
            inputs.mangowc.nixosModules.mango
            home-manager.nixosModules.home-manager
          ];
        };
      };

      homeConfigurations = {
        "clemmie@themojave" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./hosts/themojave/home.nix
            mangowc.hmModules.mango
          ];
        };

        "clemmie@blackmesa" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./hosts/blackmesa/home.nix
            mangowc.hmModules.mango
          ];
        };
      };
    };
}
