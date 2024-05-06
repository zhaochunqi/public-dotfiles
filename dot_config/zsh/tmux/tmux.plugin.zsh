# Tmuxifier
if [[ -d "$HOME/.tmuxifier/bin/" ]]; then
  export PATH="$HOME/.tmuxifier/bin:$PATH"
  eval "$(tmuxifier init -)"
fi