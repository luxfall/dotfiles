{
    flake.nixosModules.dockerDesktop = { pkgs, ... }: {
        wsl.docker-desktop.enable = true;

        systemd.tmpfiles.rules = [
            "L+ /run/docker.sock - - - - /mnt/wsl/docker-desktop/shared-sockets/guest-services/docker.proxy.sock"
        ];

        environment.systemPackages = [
            pkgs.docker-client
            pkgs.docker-compose
        ];
    };
}
