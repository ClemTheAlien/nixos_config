{
  description = "Multi-machine NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, mangowc, ... }@inputs: {
    # Desktop configuration
    nixosConfigurations.blackmesa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
              ./configuration.nix
                mangowc.nixosModules.mango
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