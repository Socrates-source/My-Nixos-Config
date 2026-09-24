{
  description = "Nixos Configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    helium.url = "github:tomsch/helium-nix";
  };

  outputs = { self, nixpkgs, helium, ... }
 @inputs: {
       nixosConfigurations = {
            Travelmate = 
       nixpkgs.lib.nixosSystem {
               system = "x86_64-linux";
               modules = [
                  ./configuration.nix
               { environment.systemPackages = [
                  helium.packages.x86_64-linux.default
           ];
          }   
        ];
      };
    };      
  };
}
