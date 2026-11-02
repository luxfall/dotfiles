{
    flake.nixosModules.hyprland = { pkgs, ... }: {
        programs.hyprland = {
            enable = true;
            withUWSM = false;
            xwayland.enable = true;
        };

        xdg.portal = {
            enable = true;
            extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # fallback (file chooser etc.)
            config.hyprland.default = [ "hyprland" "gtk" ];
        };

        # TODO: decide if hyprpolkitagent or noctalia polkit
        security.polkit.enable = true;

        systemd.user.services.hyprpolkitagent = {
            description = "Hyprland Polkit Authentication Agent";
            serviceConfig = {
                Type = "simple";
                ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
                Restart = "on-failure";
                Slice = "session.slice";
                TimeoutStopSec = "5sec";
            };
        };

        environment.sessionVariables.NIXOS_OZONE_WL = "1";

        environment.systemPackages = with pkgs; [
            hyprpolkitagent
            grim
            slurp
            wl-clipboard
        ];

        dotfiles.links = [
            {
                from = "hypr";
                to = ".config/hypr";
            }
            {
                from = "xkb";
                to = ".config/xkb";
            }
        ];
    };
}
