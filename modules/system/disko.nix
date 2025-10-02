{ lib, ... }:
{
  disko.enableConfig = true;

  disko.devices = {
    disk.main = {
      type = "disk";
      device = lib.mkDefault "/dev/disk/by-id/REPLACE-WITH-DISK";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            priority = 0;
            size = "1024MiB";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };

          swap = {
            size = "16GiB";
            type = "8200";
            content = {
              type = "swap";
              resumeDevice = true;
            };
          };

          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [ "noatime" ];
            };
          };
        };
      };
    };
  };
}
