{
    flake.nixosModules.btrfs = { pkgs, config, ... }: {
        boot.supportedFilesystems = [ "btrfs" ];

        services.btrfs.autoScrub = {
            enable = true;
            interval = "monthly";
            fileSystems = [ "/" ];
        };

        # TODO
        services.snapper = {
            snapshotRootOnBoot = false;
            configs.root = {
                SUBVOLUME = "/";
                ALLOW_USERS = [ config.preferences.user.name ];
                TIMELINE_CREATE = true;
                TIMELINE_CLEANUP = true;
                TIMELINE_LIMIT_HOURLY = "5";
                TIMELINE_LIMIT_DAILY = "7";
                TIMELINE_LIMIT_WEEKLY = "2";
                TIMELINE_LIMIT_MONTHLY = "1";
                TIMELINE_LIMIT_YEARLY = "0";
            };
        };

        environment.systemPackages = with pkgs; [
            btrfs-assistant
            btrfs-progs
            compsize
        ];
    };
}
