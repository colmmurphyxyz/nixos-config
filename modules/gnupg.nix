{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    pinentry-all
  ];

  prgrams.gnupg = {
    enable = true;
    # agent = {
    #   enable = true;
    #   pinentryPackage = pkgs.pinentry-all;
    # };
  };
}