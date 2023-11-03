eza_params=(
  '--git' '--icons' '--classify' '--group'
  '--group-directories-first' '--time-style=long-iso' '--color-scale'
)

if command -v eza >/dev/null 2>&1; then
  alias ls='eza'
  alias l='eza --git-ignore $eza_params'
  alias ll='eza --all --header --long $eza_params'
  alias llm='eza --all --header --long --sort=modified $eza_params'
  alias la='eza -lbhHigUmuSa'
  alias lx='eza -lbhHigUmuSa@'
  alias lt='eza --tree $eza_params'
  alias tree='eza --tree'
fi


