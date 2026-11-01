{
	description = "My NixOS Config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixos-wsl = {
			url = "github:nix-community/NixOS-WSL/main";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, nixos-wsl, ... }@inputs:
		let
		username = "luxfall";

	mkHost = hostName: extraModules:
		nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs username hostName; };
			modules = [
				./hosts/${hostName}
			home-manager.nixosModules.home-manager
			{
				home-manager = {
					useGlobalPkgs = true;
					useUserPackages = true;
					extraSpecialArgs = { inherit inputs username hostName; };
					sharedModules = [ ./modules/home/dotfiles.nix ];
					users.${username} = import ./hosts/${hostName}/home.nix;
				};
			}
			] ++ extraModules;
		};
	in
	{
		nixosConfigurations = {
			wsl = mkHost "wsl" [ nixos-wsl.nixosModules.default ];
		};
	};
}
