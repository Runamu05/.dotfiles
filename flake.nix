{
    description = "My Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

	home-manager = {
	  url = "github:nix-community/home-manager";
	  inputs.nixpkgs.follows = "nixpkgs";
	};
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: let
    	inherit (self) outputs;

    	system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = import nixpkgs {inherit system;};
    in {
	nixosConfigurations = {
	    system = lib.nixosSystem {
	    	inherit system;
		modules = [ ./configuration.nix ];
		specialArgs = {
		    inherit inputs;
		    inherit outputs;
		};
	    };
	};

	homeConfigurations = {
	    user = home-manager.lib.homeManagerConfiguration {
		inherit pkgs;
		modules = [ ./home.nix ];
		extraSpecialArgs = {
		    inherit inputs;
		    inherit outputs;
		};
	    };
	};
    };
}
