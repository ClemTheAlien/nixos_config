{
  description = "Multi-machine NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pokewm = {url ="git+https://codeberg.org/UraniumSoftware/pokewm";};
  };

  outputs = { self, nixpkgs, home-manager, mangowc, pokewm, ... }@inputs: {
    # Desktop configuration
    nixosConfigurations.blackmesa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
              ./configuration.nix
                mangowc.nixosModules.mango
      ];
    };
    nixosConfigurations.themojave = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
              ./configuration.nix
                mangowc.nixosModules.mango
                pokewm.nixosModules.default
      ];
    };
    nixosConfigurations.vaulttech = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
              ./configuration.nix
      ];
    };
    homeConfigurations.clemmie = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./home.nix
        inputs.mangowc.hmModules.mango
      ];
    };
  };
}
