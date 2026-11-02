{self, ...}: {
    flake.diskConfigurations.desktop = self.mkBtrfsDisk {
        device = "/dev/disk/by-id/CHANGE-ME"; # ls -l /dev/disk/by-id
    };
}
