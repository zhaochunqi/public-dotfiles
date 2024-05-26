# fzf_settings
typeset -gx -u _fzf_projects_folder

function _fzf-change-directory() {
  local items=$(ghq list -p)

  items="$items\n$(chezmoi source-path)"

  printf "%b" "$items" | fzf --query "$LBUFFER" | perl -pe 's/([ ()])/\\\\$1/g' | read -r selected_dir

  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

fzf-setup

zle -N _fzf-change-directory
bindkey '^g' _fzf-change-directory
