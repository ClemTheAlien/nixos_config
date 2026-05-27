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
    
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, mangowc, noctalia, ... }@inputs: 
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
                modules = [ 
./hosts/themojave/home.nix
   noctalia.homeModules.default
   mangowc.hmModules.mango

 ]; 
            };

                      "clemmie@blackmesa" = home-manager.lib.homeManagerConfiguration {
		inherit pkgs;
                modules = [ 
./hosts/blackmesa/home.nix
   noctalia.homeModules.default
   mangowc.hmModules.mango

 ]; 
            };
        };

  };
}
