# set up default using vim
export EDITOR="vi"
export VISUAL="$EDITOR"

if command -v nvim >/dev/null 2>&1; then
  alias vi=$(which nvim)
  alias vim=$(which nvim)
  export EDITOR=nvim
  export VISUAL="$EDITOR"
fi

