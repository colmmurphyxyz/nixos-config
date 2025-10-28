{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    pinentry-all
  ];

  programs.gnupg.agent = {
    enable = true;
    # note to self: gpg can't find pinentry on my lapptop without changing ~/.gnupg/gpg-agent.cong
    # consider doing this via home-manager or whatevs
    pinentryPackage = pkgs.pinentry-all;
  };
}
