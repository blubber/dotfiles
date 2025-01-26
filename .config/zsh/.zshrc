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

export PATH="${HOME}/.local/bin:$PATH"

export PAGER="nvim -"
export EDITOR="nvim"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"


case $(uname) in
  "Darwin")
    source "$HOME/.config/zsh/macos"
    ;;

  "Linux")
    source "$HOME/.config/zsh/linux"
    ;;

esac

source "$HOME/.config/zsh/aliases"
source "$HOME/.config/zsh/pg"
