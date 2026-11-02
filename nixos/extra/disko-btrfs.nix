# Shared btrfs layout
{
    flake.mkBtrfsDisk = { device, luks ? false, espSize ? "1G" }: let
    opts = [ "compress=zstd" "noatime" ];

    btrfs = {
        type = "btrfs";
        extraArgs = [ "-f" "-L" "nixos" ];
        subvolumes = {
            "/@" = {
                mountpoint = "/";
                mountOptions = opts;
            };
            "/@home" = {
                mountpoint = "/home";
                mountOptions = opts;
            };
            "/@nix" = {
                mountpoint = "/nix";
                mountOptions = opts;
            };
            "/@log" = {
                mountpoint = "/var/log";
                mountOptions = opts;
            };
            "/@snapshots" = {
                mountpoint = "/.snapshots";
                mountOptions = opts;
            };
        };
    };
    luks = {
        type = "luks";
        name = "cryptroot";
        settings.allowDiscards = true;
        content = btrfs;
    };

    in {
        disko.devices.disk.main = {
            inherit device;
            type = "disk";
            content = {
                type = "gpt";
                partitions = {
                    ESP = {
                        size = espSize;
                        type = "EF00";
                        content = {
                            type = "filesystem";
                            format = "vfat";
                            mountpoint = "/boot";
                            mountOptions = ["umask=0077"];
                        };
                    };
                    root = {
                        size = "100%";
                        content =
                        if luks then luks
                        else btrfs;
                    };
                };
            };
        };
    };
}
