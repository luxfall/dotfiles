{ self, ... }: {
    flake.nixosModules.general = { pkgs, lib, config, ... }: let
    user = config.preferences.user.name;
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
    in {
        imports = [
            self.nixosModules.base
            self.nixosModules.extra_dotfiles
            self.nixosModules.nix
            self.nixosModules.shell
        ];

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

        users.users.${user} = {
            isNormalUser = true;
            description = user;
            extraGroups = [ "wheel" ];
            shell = pkgs.zsh;
            initialPassword = "123";
        };

        time.timeZone = lib.mkDefault "Europe/Rome";
        i18n.defaultLocale = "en_US.UTF-8";

        # TODO: neovim
        programs.neovim = {
            enable = true;
            defaultEditor = true;
            viAlias = true;
            vimAlias = true;
        };

        environment.systemPackages =
        [
            selfpkgs.git
        ]
        ++ (with pkgs; [
            bat
            duf
            eza
            fd
            fzf
            jq
            ripgrep
            tealdeer # tldr
            tmux
            unzip
            zip
            #_7zz # 7zip # TODO:
            zoxide
            openssh # ssh-tools TODO
            fastfetch
            btop
            curl
            wget
            file
            tree
            gcc
            gnumake
            tree-sitter
            nodejs
            lua-language-server
        ]);

        dotfiles.links = [
            {
                from = "nvim";
                to = ".config/nvim";
            }
            {
                from = "tmux";
                to = ".config/tmux";
            }
            {
                from = "btop";
                to = ".config/btop";
            }
        ];
    };
}
