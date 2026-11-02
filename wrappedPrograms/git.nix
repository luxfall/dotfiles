{ inputs, ... }: {
    perSystem = { pkgs, ... }: let
    # your gitconfig + an absolute excludesFile (the original ~/.gitignore_global
    # is not stowed anymore). Later [core] sections override earlier ones.
    gitconfig = pkgs.writeText "gitconfig" ''
        ${builtins.readFile ../dotfiles/git/gitconfig}

        [core]
        excludesFile = ${../dotfiles/git/gitignore_global}
    '';
    in {
        packages.git = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.git;
            env = rec {
                GIT_CONFIG_GLOBAL = "${gitconfig}";
                GIT_AUTHOR_NAME = "CHANGE ME";
                GIT_AUTHOR_EMAIL = "change@me.example";
                GIT_COMMITTER_NAME = GIT_AUTHOR_NAME;
                GIT_COMMITTER_EMAIL = GIT_AUTHOR_EMAIL;
            };
        };
    };
}
