{ pkgs, username, hostName, ... }: {
  imports = [
    ../../modules/nixos/base.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = username;
  wsl.docker-desktop.enable = true;
  systemd.tmpfiles.rules = [
    "L+ /run/docker.sock - - - - /mnt/wsl/docker-desktop/shared-sockets/guest-services/docker.proxy.sock"
  ];
  wsl.extraBin = with pkgs; [
    # Commands required by Docker Desktop's WSL integration
    { src = "${coreutils}/bin/test"; }
    { src = "${coreutils}/bin/uname"; }
    { src = "${coreutils}/bin/whoami"; }
    { src = "${coreutils}/bin/cat"; }
    { src = "${coreutils}/bin/ls"; }
    { src = "${coreutils}/bin/mkdir"; }
  ];

  networking.hostName = hostName;

  system.stateVersion = "26.05";

#  virtualisation.docker.rootless = {
#	  enable = true;
#	  setSocketVariable = true;
#  };
#  environment.systemPackages = with pkgs; [
#	  docker-compose
#  ];
}
