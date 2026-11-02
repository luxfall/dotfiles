{
    flake.nixosModules.powersave = { pkgs, ... }: {
        powerManagement.enable = true;
        services.power-profiles-daemon.enable = true;
        services.upower.enable = true;

        services.logind.settings.Login = {
            HandleLidSwitch = "suspend";
            HandleLidSwitchExternalPower = "lock";
        };

        environment.systemPackages = [ pkgs.brightnessctl ];
    };
}
