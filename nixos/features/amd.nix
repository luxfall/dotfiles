{
    flake.nixosModules.amd = { config, lib, ... }: {
        hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

        boot.kernelModules = [ "kvm-amd" ];

        hardware.amdgpu.initrd.enable = true;

        hardware.graphics = {
            enable = true;
            enable32Bit = true; # steam, wine
        };
    };
}
