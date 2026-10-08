{
  description = "Nixos Configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:youwen5/zen-browser-flake";
     zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

 outputs = { self, nixpkgs, zen-browser, ... }
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
