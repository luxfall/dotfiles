{ inputs, self, ... }: {
    flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        modules = [self.nixosModules.hostDesktop];
    };

    flake.nixosModules.hostDesktop = {
        imports = [
            self.nixosModules.general
            self.nixosModules.desktop

            self.nixosModules.hardwareCommon
            self.nixosModules.hardwareDesktop
            self.nixosModules.amd
            self.nixosModules.lact

            self.nixosModules.limine
            self.nixosModules.btrfs

            self.nixosModules.gaming

            # disk layout
            inputs.disko.nixosModules.disko
            self.diskConfigurations.desktop
        ];

        networking.hostName = "umbra";

        # Set this to the release you FIRST install and never change it.
        system.stateVersion = "26.05";
    };
}
