{
    flake.nixosModules.gaming = { pkgs, ... }: {
        hardware.graphics.enable32Bit = true;

        programs = {
            gamemode.enable = true;
            steam = {
                enable = true;
                remotePlay.openFirewall = true;
                # extraCompatPackages = [pkgs.proton-ge-bin]; # TODO
            };
        };

        # TODO
        environment.systemPackages = with pkgs; [
            mangohud
            # gamescope, lutris, heroic, prismlauncher, ...
        ];
    };
}
