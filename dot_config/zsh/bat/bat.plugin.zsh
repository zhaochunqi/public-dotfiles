# Function to set up bat completion
bat_completion_setup() {
  if command -v bat >/dev/null 2>&1; then
    # Create completion directory if it doesn't exist
    local completion_dir="${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/completions"
    mkdir -p "$completion_dir"

    # Generate completion script
    bat --completion zsh > "$completion_dir/_bat"

    # Add completion directory to fpath if not already there
    if [[ ! " ${fpath[@]} " =~ " ${completion_dir} " ]]; then
      fpath=("$completion_dir" $fpath)
    fi

    # Load the completion
    compinit -d "${ZSH_COMPDUMP:-$HOME/.zcompdump}"
  else
    echo "bat command not found. Please ensure it's installed and in your PATH."
  fi
}

# Run the setup function
bat_completion_setup