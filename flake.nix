{
  description = "Nixos Configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";    
    };
  halley = { 
    url = "github:binarylinuxx/halley-flake";
    inputs.nixpkgs.follows = "nixpkgs";
    };

  outputs = { self, nixpkgs, halley, ... }
 @inputs: {
       nixosConfigurations = {
            Travelmate = 
       nixpkgs.lib.nixosSystem {
               system = "x86_64-linux";
               modules = [
                  ./configuration.nix
                  halley.nixosModules.default
        ];
      };
    };      
  };
}
