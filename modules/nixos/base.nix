{ pkgs, username, ... }: {
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nix.optimise.automatic = true;
	nixpkgs.config.allowUnfree = true;

	programs.nix-ld.enable = true;

	time.timeZone = "Europe/Rome";
	i18n.defaultLocale = "en_US.UTF-8";

	programs.zsh.enable = true;
	users.users.${username} = {
		isNormalUser = true;
		shell = pkgs.zsh;
		extraGroups = [ "wheel" "networkmanager" "video" ];
	};

	environment.systemPackages = with pkgs; [ git vim ];
}
