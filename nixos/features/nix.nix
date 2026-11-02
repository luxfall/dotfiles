{inputs, ...}: {
    flake.nixosModules.nix = { pkgs, config, ... }: {
        imports = [ inputs.nix-index-database.nixosModules.nix-index ];
        programs.nix-index-database.comma.enable = true;

        nix.settings = {
            experimental-features = [ "nix-command" "flakes" ];
            auto-optimise-store = true;
            trusted-users = [ "root" "@wheel" ];
        };

        nixpkgs.config.allowUnfree = true;

        programs.nix-ld.enable = true;

        programs.nh = {
            enable = true;
            flake = config.preferences.repoPath;
            clean = {
                enable = true;
                extraArgs = "--keep-since 30d --keep 5";
            };
        };

        programs.direnv = {
            enable = true;
            nix-direnv.enable = true;
        };

        environment.systemPackages = with pkgs; [
            nil
            nixd
            statix
            alejandra
        ];
    };
}
