{
    flake.nixosModules.apps = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            foot
            mpv
            brave-origin
            kdePackages.dolphin
            kdePackages.ark
            kdePackages.kio-extras
        ];

        services.udisks2.enable = true; # mounting from dolphin

        dotfiles.links = [
            {
                from = "foot";
                to = ".config/foot";
            }
        ];
    };
}
