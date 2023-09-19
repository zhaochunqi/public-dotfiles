exa_params=(
  '--git' '--icons' '--classify' '--group'
  '--group-directories-first' '--time-style=long-iso' '--color-scale'
)

if command -v exa >/dev/null 2>&1; then
  alias ls='exa'
  alias l='exa --git-ignore $exa_params'
  alias ll='exa --all --header --long $exa_params'
  alias llm='exa --all --header --long --sort=modified $exa_params'
  alias la='exa -lbhHigUmuSa'
  alias lx='exa -lbhHigUmuSa@'
  alias lt='exa --tree $exa_params'
  alias tree='exa --tree'
fi


