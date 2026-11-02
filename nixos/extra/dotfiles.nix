# Replacement for stow
{
    flake.nixosModules.extra_dotfiles = { config, lib, ... }: let
    cfg = config.dotfiles;
    user = config.preferences.user.name;
    home = "/home/${user}";
    dotRoot = ../../dotfiles;

    join = parts: lib.concatStringsSep "/" (lib.filter (s: s != "") parts);

    linksFor = { from, to }: let
    src = dotRoot + "/${from}";
    in
    map (file: let
        rel = lib.removePrefix "./" (lib.path.removePrefix src file);
        in {
            link = "${home}/${join [to rel]}";
            target = "${cfg.path}/${join [from rel]}";
        }) (lib.filesystem.listFilesRecursive src);

    links = lib.concatMap linksFor cfg.links;

    ancestors = link: let
    parts = lib.splitString "/" (lib.removePrefix "${home}/" (dirOf link));
    in
    if dirOf link == home
    then []
    else lib.imap1 (i: _: "${home}/${join (lib.take i parts)}") parts;

    dirs = lib.unique (lib.concatMap (l: ancestors l.link) links);
    in {
        options.dotfiles = {
            path = lib.mkOption {
                type = lib.types.str;
                default = "${config.preferences.repoPath}/dotfiles";
                description = "Absolute path of the dotfiles directory in the checkout";
            };

            links = lib.mkOption {
                default = [];
                description = "Directories of dotfiles/ to link into $HOME, stow style";
                type = lib.types.listOf (lib.types.submodule {
                    options = {
                        from = lib.mkOption {
                            type = lib.types.str;
                            example = "hypr";
                            description = "Directory name inside dotfiles/";
                        };
                        to = lib.mkOption {
                            type = lib.types.str;
                            example = ".config/hypr";
                            description = "Target directory relative to $HOME (\"\" for $HOME itself)";
                        };
                    };
                });
            };
        };

        config.systemd.tmpfiles.rules =
        (map (d: "d ${d} 0755 ${user} users -") dirs)
        ++ (map (l: "L+ ${l.link} - - - - ${l.target}") links);
    };
}
