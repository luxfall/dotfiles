# WSL: terminal tools only, no desktop modules.
{ pkgs, username, ... }: {
  imports = [
    ../../modules/home/cli.nix
    ../../modules/home/zsh.nix
    ../../modules/home/neovim.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
  };

  home.packages = with pkgs; [
    yt-dlp
    sqlitebrowser
    docker
    docker-buildx
  ];

}
