{ config, pkgs, libs, ... }:
{
  time.timeZone = "Europe/Dublin";
  i18n.defaultLocale = "en_IE.UTF-8";

  environment.systemPackages = with pkgs; [
    curl
    dig
    direnv
    fastfetch
    file
    git
    htop
    neovim
    nixfmt-rfc-style
    nix-direnv
    tree
    unzip
    wget
    vim
    wget
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };

  nixpkgs.config.allowUnfree = true;
}
