{
    flake.nixosModules.base = { lib, config, ... }: {
        options.preferences = {
            user.name = lib.mkOption {
                type = lib.types.str;
                default = "luxfall";
                description = "username";
            };

            repoPath = lib.mkOption {
                type = lib.types.str;
                default = "/home/${config.preferences.user.name}/nixconf";
                description = "Absolute path of the repository";
            };
        };
    };
}
