{ inputs, self, ... }: {
    flake.nixosConfigurations.wsl = inputs.nixpkgs.lib.nixosSystem {
        modules = [ self.nixosModules.hostWsl ];
    };

    flake.nixosModules.hostWsl = { config, ... }: {
        imports = [
            inputs.nixos-wsl.nixosModules.default

            self.nixosModules.general
            self.nixosModules.dockerDesktop
        ];

        wsl = {
            enable = true;
            defaultUser = config.preferences.user.name;
            # useWindowsDriver = true;
        };

        networking.hostName = "twilight";

        system.stateVersion = "26.05";
    };
}
