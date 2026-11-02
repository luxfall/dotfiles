{ inputs, ... }: {
    flake.nixosModules.noctalia = { pkgs, ... }: {
        environment.systemPackages = [
            inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

        # prebuilt binaries
        nix.settings = {
            extra-substituters = [ "https://noctalia.cachix.org" ];
            extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
        };

        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
        };
        services.upower.enable = true;
        services.power-profiles-daemon.enable = true;
        services.accounts-daemon.enable = true;

        dotfiles.links = [
            {
                from = "noctalia";
                to = ".config/noctalia";
            }
        ];
    };
}
