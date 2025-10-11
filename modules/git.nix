{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    vim # for use as default editor
  ];

  programs.git = {
    enable = true;
    config = {
      user.name = "Colm Murphy";
      user.email = "colmmurphy016@gmail.com";
    
      core.editor = "vim";
      init.defaultBranch = "main";

      pull.rebase = true;
    };
  };
}
