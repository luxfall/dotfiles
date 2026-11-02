{
    flake.nixosModules.lact = {
        hardware.amdgpu.overdrive.enable = true;
        services.lact.enable = true;
    };
}
