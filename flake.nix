{
  description = "Nixos Configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }
 @inputs: {
       nixosConfigurations = {
            Travelmate = 
       nixpkgs.lib.nixosSystem {
               system = "x86_64-linux";
               modules = [
                  ./configuration.nix
        ];
      };
    };      
  };
}
