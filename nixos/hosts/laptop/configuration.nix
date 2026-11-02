{ inputs, self, ... }: {
    flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
        modules = [ self.nixosModules.hostLaptop ];
    };

    flake.nixosModules.hostLaptop = {
        imports = [
            self.nixosModules.general
            self.nixosModules.desktop

            self.nixosModules.hardwareCommon
            self.nixosModules.hardwareLaptop
            self.nixosModules.amd
            self.nixosModules.powersave

            self.nixosModules.limine
            self.nixosModules.btrfs

            inputs.disko.nixosModules.disko
            self.diskConfigurations.laptop
        ];

        networking.hostName = "moonbow";

        system.stateVersion = "26.05";
    };
}
