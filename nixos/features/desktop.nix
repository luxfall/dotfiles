{ self, ... }: {
    flake.nixosModules.desktop = {
        imports = [
            self.nixosModules.hyprland
            self.nixosModules.greeter
            self.nixosModules.noctalia
            self.nixosModules.theming
            self.nixosModules.apps
            self.nixosModules.audio
            self.nixosModules.networking
        ];
    };
}
