#!/bin/bash
# Sets up tailscale
set -e

SCRIPTDIR="$(dirname -- $0)"

main() {
    setup_tailscale
}

# Setup dependencies for plugins
setup_tailscale() {
    curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
    curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
    sudo apt update
    curl -fsSL https://tailscale.com/install.sh | sh
}

main "$@"
