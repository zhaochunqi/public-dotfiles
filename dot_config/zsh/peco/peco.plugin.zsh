# peco_settings
typeset -gx -u _peco_projects_folder

_peco_projects_folder=(
  "$HOME/Developer"
)

function _peco-change-directory() {
  local items=`ghq list -p`

  for cpath in "${_peco_projects_folder[@]}"; do
    if [ ! -d "$cpath" ]; then
      continue
    fi

    if [ -z "$(command ls -A $cpath)" ]; then
      continue
    fi

    items="$items\n"
    items+=$(command ls -ad $cpath/* | grep -v \.git)
  done

  items="$items\n$(chezmoi source-path)"

  # if [ -d "/mnt/c/Users/zhaoc/Documents/MyLifeRecorded" ]; then
  #   items="$items\n/mnt/c/Users/zhaoc/Documents/MyLifeRecorded"
  # fi

  # 使用 正则进行转义,然后使用 read 避免再次转义
  echo "$items"| awk 'NF' | peco --query "$LBUFFER" | perl -pe 's/([ ()])/\\\\$1/g' | read selected_dir

  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}


peco-setup

zle -N _peco-change-directory
bindkey '^g' _peco-change-directory
