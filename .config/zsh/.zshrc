eval "$(starship init zsh)"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}


eval "$(fzf --zsh)"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi


function git_branch {
  b=$(git branch --no-color --no-column --format '%(refname:short)' | less | fzf); test $? -eq 0 && git checkout $b
}


alias gs="git status"
alias gc="git commit"
alias gb="git_branch"

alias t=tmux-sessionizer
alias man="man -P 'col -b | nvim -'"

export PATH="${HOME}/.local/bin:$PATH"

export PAGER="nvim -"


function _auto_venv {
  dirname=$(realpath $PWD)
  homedir=$(realpath $HOME)

  while [[ "$dirname" == "$homedir/"* ]]; do
    venvdir="$dirname/venv"

    if [[ -d "$venvdir" ]]; then
      export VENV_ROOT="$dirname"
      . "$venvdir/bin/activate"
      return
    fi

    dirname=$(dirname "$dirname")
  done
}

function cd {
  builtin cd "$@" || return

  dirname=$(realpath $PWD)
  homedir=$(realpath $HOME)

  if [[ -z "$VENV_ROOT" ]]; then
    _auto_venv
  elif [[ "$dirname" != "$VENV_ROOT/"* ]]; then
    deactivate
    unset VENV_ROOT
  fi
}


_auto_venv
