{
    flake.nixosModules.hardwareCommon = { pkgs, lib, ... }: {
        hardware.enableRedistributableFirmware = true;

        boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

        zramSwap.enable = true;
        services.fstrim.enable = true;
    };
}
