{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-screenshot
    xdotool
  ];

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/close-window/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/maximize-window/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-terminal/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot-area/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/close-window" = {
      name = "Close Window";
      command = "xdotool getwindowfocus windowclose";
      binding = "<Super>q";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/maximize-window" = {
      name = "Maximize Window";
      command = "xdotool getwindowfocus windowsize 100% 100%";
      binding = "<Super>m";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-terminal" = {
      name = "Open Terminal";
      command = "kgx";
      binding = "<Super>t";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot-area" = {
      name = "Take Area Screenshot";
      command = "gnome-screenshot -a";
      binding = "<Super><Shift>S";
    };
  };
}
