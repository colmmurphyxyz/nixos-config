{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "colm";
    configDir = "/home/colm/.config/syncthing";
    settings = {
      gui = {
        user = "colm";
        password = "overmatching";
      };
      devices = {
        "oneplus12r" = {
          id = "W2FCLBF-HNK42EW-PTN35LX-FAUOK2N-REPZJRX-DWFKWFA-BSLM3BO-DPKYBAJ";
        };
      };
      folders = {
        "Books" = {
          id = "5psqh-grms2";
          path = "~/Books";
          devices = [ "oneplus12r" ];
        };
        "Music" = {
          id = "Music";
          path = "~/Music";
          devices = [ "oneplus12r" ];
        };
        "notes" = {
          id = "notes";
          path = "~/notes";
          devices = [ "oneplus12r" ];
        };
      };
    };
  };

  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
}
