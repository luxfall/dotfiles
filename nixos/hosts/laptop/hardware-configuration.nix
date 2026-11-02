# nixos-generate-config --no-filesystems --root /mnt
{
    flake.nixosModules.hardwareLaptop = { lib, modulesPath, ... }: {
        imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

        # --- placeholder, replace with generated values ---------------------
        boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
        boot.kernelModules = ["kvm-amd"];
        # --------------------------------------------------------------------------

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    };
}
