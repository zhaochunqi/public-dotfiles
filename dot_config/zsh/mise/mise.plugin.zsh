# Load command
if command -v mise &> /dev/null; then
    eval "$(mise activate zsh --shims)"
fi

# Check if mise and flutter exist, then export FLUTTER_ROOT
if command -v mise &> /dev/null && command -v flutter &> /dev/null; then
    export FLUTTER_ROOT="$(mise where flutter)"
fi

# Function to set up Mise completion
mise_completion_setup() {
  if command -v mise >/dev/null 2>&1; then
    # Create completion directory if it doesn't exist
    local completion_dir="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/completions"
    mkdir -p "$completion_dir"

    # Generate completion script
    mise completion zsh > "$completion_dir/_mise"

    # Add completion directory to fpath if not already there
    if [[ ! " ${fpath[@]} " =~ " ${completion_dir} " ]]; then
      fpath=("$completion_dir" $fpath)
    fi

    # Load the completion
    compinit -d "${ZSH_COMPDUMP:-$HOME/.zcompdump}"
  else
    echo "mise command not found. Please ensure it's installed and in your PATH."
  fi
}

# Run the setup function
mise_completion_setup