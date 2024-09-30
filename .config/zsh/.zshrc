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

echo "RC"
