{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Colm Murphy";
        email = "colmmurphy016@gmail.com";
        signingkey = "F6448CF5DE5510D388858B26C9C3B039526E280C";
      };
      core = {
        editor = "${pkgs.vim}/bin/vim";
      };
      pull = {
        rebase = true;
      };
      init = {
        defaultBranch = "main";
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
