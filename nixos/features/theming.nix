{
    flake.nixosModules.theming = { pkgs, lib, ... }: {
        fonts = {
            packages = with pkgs; [
                nerd-fonts.jetbrains-mono
                inter
            ];
            fontconfig.defaultFonts = {
                sansSerif = [ "Inter" ];
                serif = [ "Inter" ];
                monospace = [ "JetBrainsMono Nerd Font" ];
            };
        };

        programs.dconf.enable = true; # GTK settings

        qt = {
            enable = true;
            platformTheme = "qt5ct";
        };

        environment.systemPackages =
        [
            pkgs.matugen
            pkgs.tela-circle-icon-theme
        ]
        # KDE's Union style engine. Guarded because I could not verify the attribute name.
        ++ lib.optional (pkgs.kdePackages ? union) pkgs.kdePackages.union;

        dotfiles.links = [
            {
                from = "matugen";
                to = ".config/matugen";
            }
            {
                from = "qt";
                to = ".config/qt6ct";
            }
            {
                from = "kde";
                to = ".config"; # dolphinrc
            }
        ];
    };
}
