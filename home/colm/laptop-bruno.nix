{ config, pkgs, ... }:
{
  imports = [
    ./features/bash
    ./features/git.nix
    ./features/htop.nix
    ./features/keybinds
  ];

  programs.home-manager.enable = true;
  home.username = "colm";
  home.homeDirectory = "/home/colm";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    jetbrains.idea-community
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}