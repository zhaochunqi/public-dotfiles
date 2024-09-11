# Load command
if command -v mise &> /dev/null; then
    eval "$(mise activate zsh)"
fi

# Check if mise and flutter exist, then export FLUTTER_ROOT
if command -v mise &> /dev/null && command -v flutter &> /dev/null; then
    export FLUTTER_ROOT="$(mise where flutter)"
fi