{ self, ... }: {
    flake.diskConfigurations.laptop = self.mkBtrfsDisk {
        device = "/dev/disk/by-id/CHANGE-ME";
        luks = true; # full disk encryption; limine only needs the unencrypted ESP
    };
}
