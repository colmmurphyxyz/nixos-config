{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-screenshot
    xdotool
  ];

  xdg.gnome.keybindings = {
    "close-window" = {
      name = "Close Window";
      command = "xdotool getwindowfocus windowclose";
      binding = "<Super>q";
    };

    "maximize-window" = {
      name = "Maximize Window";
      command = "xdotool getwindowfocus windowsize 100% 100%";
      binding = "<Super>m";
    };

    "screenshot-area" = {
      name = "Take Area Screenshot";
      command = "gnome-screenshot -a";
      binding = "<Shift><Print>";
    };

    "open-terminal" = {
      name = "Open Terminal";
      command = "kgx";
      binding = "<Super>t";
    };
  };
}