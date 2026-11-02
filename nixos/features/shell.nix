{
    flake.nixosModules.shell = { pkgs, ... }: {
        programs.zsh = {
            enable = true;
            autosuggestions.enable = true;
            syntaxHighlighting.enable = true;
        };

        environment.sessionVariables.ZSH = "${pkgs.oh-my-zsh}/share/oh-my-zsh";

        environment.pathsToLink = ["/share/zsh"];

        dotfiles.links = [
            {
                from = "zsh";
                to = "";
            }
            {
                from = "oh-my-zsh";
                to = ".config/oh-my-zsh/custom/themes";
            }
        ];
    };
}
