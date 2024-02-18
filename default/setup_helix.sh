#!/bin/bash
# Sets up Helix
set -e

SCRIPTDIR="$(dirname -- $0)"
SHAREDDIR="$SCRIPTDIR/../shared"

main() {
    setup_dependencies
    setup_helix
    make_links
}

# Setup repo
setup_dependencies() {
    sudo apt install snap -y
}

# Install Helix
setup_helix() {
    sudo apt install helix
}

# Link configs
make_links() {
    mkdir -p ~/.config/helix/themes
    ln -sf "$(realpath $SHAREDDIR/languages.toml)" "$HOME/.config/helix/languages.toml"
    ln -sf "$(realpath $SHAREDDIR/config.toml)" "$HOME/.config/helix/config.toml"
    ln -sf "$(realpath $SHAREDDIR/marcorentap.toml)" "$HOME/.config/helix/themes/marcorentap.toml"
}

main "$@"
