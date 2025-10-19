{ ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      eval "$(direnv hook bash)"

      export EDITOR=nvim;
      alias ls='ls -alh';
      alias cls='clear';
    '';
  };

  home.file.".bash_profile".text = ''
      [[ -f ~/.bashrc ]] && source ~/.bashrc
  '';
}
