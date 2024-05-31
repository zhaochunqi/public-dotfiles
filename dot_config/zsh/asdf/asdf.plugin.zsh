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

# ASDF CONFIGS
export ASDF_DATA_DIR=~/.asdf
java_home=~/.asdf/plugins/java/set-java-home.zsh
if [ -f "$java_home" ]; then
  . $java_home
fi

golang_env=~/.asdf/plugins/golang/set-env.zsh
if [ -f "$golang_env" ]; then
  . $golang_env
fi
