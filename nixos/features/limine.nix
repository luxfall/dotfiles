{
    flake.nixosModules.limine = {
        boot.loader = {
            limine = {
                enable = true;
                efiSupport = true;
                maxGenerations = 15;

                # Secure boot (needs sbctl keys enrolled first):
                # secureBoot.enable = true;
            };
            efi.canTouchEfiVariables = true;
            timeout = 3;
        };
    };
}
