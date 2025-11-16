{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      astro-build.astro-vscode
      eamodio.gitlens
      haskell.haskell
      jnoortheen.nix-ide
      justusadam.language-haskell
      vscodevim.vim
    ];

    profiles.colm.userSettings = {
      "[nix]"."editor.tabSize" = 2;
    };
  };
}
