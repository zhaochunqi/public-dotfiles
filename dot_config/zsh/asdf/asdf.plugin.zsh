# Find where asdf should be installed
ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"
ASDF_COMPLETIONS="$ASDF_DIR/completions"

# Load command
if [[ -f "$ASDF_DIR/asdf.sh" ]]; then
  . "$ASDF_DIR/asdf.sh"

  # Load completions
  if [[ -f "$ASDF_COMPLETIONS/asdf.bash" ]]; then
    . "$ASDF_COMPLETIONS/asdf.bash"
  fi
fi
