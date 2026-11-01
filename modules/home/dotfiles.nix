{ config, ... }: {
	_module.args.link = path:
		config.lib.file.mkOutOfStoreSymlink
		"${config.home.homeDirectory}/nixos-config/dotfiles/${path}";
 }
