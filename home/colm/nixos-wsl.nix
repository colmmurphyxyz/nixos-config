{ config, pkgs, ... }:
{
  imports = [
    ./features/bash
    ./features/git.nix
    ./features/htop.nix
  ];

  programs.home-manager.enable = true;
  home.username = "colm";
  home.homeDirectory = "/home/colm";

  home.stateVersion = "25.05";

  home.packages = [

  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}