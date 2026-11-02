{
    flake.nixosModules.greeter = {
        services.displayManager.noctalia-greeter = {
            enable = true;
            settings = {
                cursor.size = 24;
                keyboard.layout = "us"; # TODO: match layout
            };
        };
    };
}
