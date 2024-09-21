# just.plugin.zsh

# Function to set up Just completion
just_completion_setup() {
  if command -v just >/dev/null 2>&1; then
    # Create completion directory if it doesn't exist
    local completion_dir="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/completions"
    mkdir -p "$completion_dir"

    # Generate completion script
    just --completions zsh > "$completion_dir/_just"

    # Add completion directory to fpath if not already there
    if [[ ! " ${fpath[@]} " =~ " ${completion_dir} " ]]; then
      fpath=("$completion_dir" $fpath)
    fi

    # Load the completion
    compinit -d "${ZSH_COMPDUMP:-$HOME/.zcompdump}"
  else
    echo "just command not found. Please ensure it's installed and in your PATH."
  fi
}

# Run the setup function
just_completion_setup
