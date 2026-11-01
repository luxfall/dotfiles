{ pkgs, ... }: {
	home.packages = with pkgs; [
		fastfetch
			jq
			ripgrep
			fd
			duf
			zip
			unzip
	];

	programs.git = {
		enable = true;
		settings = {
			user.name = "Damian Gasser";
			user.email = "damian.gasser@gmail.com";
			init.defaultBranch = "main";
		};
	};

	programs.fzf.enable = true;
	programs.zoxide.enable = true;
	programs.eza.enable = true;
	programs.bat.enable = true;
	programs.tealdeer = {
		enable = true;
		enableAutoUpdates = false;
	};
	programs.pay-respects.enable = true;

	programs.direnv = {
		enable = true;
		nix-direnv.enable = true;
	};
	       }
