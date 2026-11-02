{
    flake.nixosModules.networking = { config, ... }: {
        networking = {
            networkmanager.enable = true;
            nftables.enable = true;
            firewall.enable = true;
        };

        users.users.${config.preferences.user.name}.extraGroups = [ "networkmanager" ];
    };
}
