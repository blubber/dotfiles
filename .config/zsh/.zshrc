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
  b=$(git branch --no-color --no-column --format '%(refname:short)' | fzf); test $? -eq 0 && git checkout $b
}


alias gs="git status"
alias gc="git commit"
alias gb="git_branch"


function k8s_context {
  ctx=$(kubectl config get-contexts | grep -v '^CURRENT' | sed 's/*//' | awk '// { print $1 }' | fzf)
  test $? -eq 0 && kubectl config use-context $ctx
}

alias kc="k8s_context"

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


export PGHOST=127.0.0.1
export PGUSER=postgres
export PGPASSWORD=postgres

alias pgstart="docker start pg || docker run -d --rm --name pg -e POSTGRES_PASSWORD=$PGPASSWORD -v ~/.pgdata:/var/lib/postgresql/data -p '127.0.0.1:5432:5432' postgres:16"

alias vim="nvim"
export EDITOR="nvim"
