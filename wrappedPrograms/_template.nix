# Use a wrapper when the config is STATIC (nothing writes to it at runtime).
# Use `dotfiles.links` (nixos/extra/dotfiles.nix) when it must stay writable/live-editable,
# e.g. everything matugen touches.
#
# Install the result in a feature module with:
#   environment.systemPackages = [self.packages.${pkgs.stdenv.hostPlatform.system}.<name>];

{ inputs, ... }: {
    perSystem = { pkgs, ... }: {
        packages.NAME = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.NAME;
            runtimeInputs = [];
            env = {};
            flags = {};
        };
    };
}
