eval "$(starship init zsh)"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}


eval "$(fzf --zsh)"

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
	autoload -Uz compinit
	compinit
fi

alias gs="git status"
alias gc="git commit"
alias t=tmux-sessionizer
alias man="man -P 'col -b | nvim -'"

export PATH="${HOME}/.local/bin:$PATH"

export PAGER="nvim -"

echo "RC"
