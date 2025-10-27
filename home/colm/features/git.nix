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
      user = {
        signingkey = "F6448CF5DE5510D388858B26C9C3B039526E280C";
      };
      commit = {
        gpgsign = true;
      };
      tag = {
        gpgSign = true;
      };
    };
  };
}
