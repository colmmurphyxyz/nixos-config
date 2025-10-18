{ ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export $EDITOR=nvim;
      alias ls='ls -alh';
      alias cls='clear';
    '';

    bashProfileExtra = ''
      [[ -f ~/.bashrc ]] && source ~/.bashrc
    '';
  };
}
