{ pkgs, ... }:
let
  other-extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "vscode-theme-darcula";
      publisher = "rokoroku";
      version = "1.2.3";
      sha256 = "tlI+3DyDPo9tTOVTrEHoOtVTnEYSjgu9wojTXmEvv4E=";
    }
  ];
in
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      astro-build.astro-vscode
      eamodio.gitlens
      haskell.haskell
      jnoortheen.nix-ide
      justusadam.language-haskell
      vscodevim.vim
    ] ++ other-extensions;

    profiles.default.userSettings = {
      "workbench.colorTheme" = "Darcula";
      "[nix]"."editor.tabSize" = 2;
    };
  };
}
