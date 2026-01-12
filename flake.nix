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
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, mangowc, pokewm, nixos-hardware, ... }@inputs: {
    # Desktop configuration
    nixosConfigurations.blackmesa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
              ./configuration.nix
                mangowc.nixosModules.mango
                inputs.dms.nixosModules.dankMaterialShell
                inputs.dms.nixosModules.greeter
      ];
    };
    nixosConfigurations.themojave = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
              ./configuration.nix
                mangowc.nixosModules.mango
                pokewm.nixosModules.default
                nixos-hardware.nixosModules.lenovo-thinkpad-t480
                inputs.dms.nixosModules.dankMaterialShell
                inputs.dms.nixosModules.greeter
      ];
    };
    homeConfigurations.clemmie = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./home.nix
        inputs.mangowc.hmModules.mango
        inputs.dms.homeModules.dankMaterialShell.default
      ];
    };
  };
}
