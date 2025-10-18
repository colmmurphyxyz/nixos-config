{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "Colm Murphy";
    userEmail = "colmmurphy016@gmail.com";
    extraConfig = {
      core = {
        editor = "${pkgs.vim}/bin/vim";
      };
      pull = {
        rebase = true;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
