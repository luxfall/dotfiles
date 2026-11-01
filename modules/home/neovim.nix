{ pkgs, link, ... }: {
	home.packages = with pkgs; [
		neovim
			gcc
			gnumake
			tree-sitter
			nodejs
			lua-language-server
			nil
			nixfmt
			stylua
	];

	xdg.configFile."nvim".source = link "nvim";
	home.sessionVariables.EDITOR = "nvim";
}
