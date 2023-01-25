#!/bin/bash
# Sets up NeoVim with plugins
set -e

SCRIPTDIR="$(dirname -- $0)"

main() {
    setup_radare2
    setup_radare2_ghidra
    setup_pwndbg
    setup_pwndbg_ghidra
}

setup_radare2() {
    git clone https://github.com/radareorg/radare2
    radare2/sys/install.sh
    
    ln -sf "$(realpath $SCRIPTDIR/.radare2rc)" "$HOME/.radare2rc"

    mkdir -p "$HOME/.local/share/radare2/r2panels/"
    ln -sf "$(realpath $SCRIPTDIR/r2panels/main)" "$HOME/.local/share/radare2/r2panels/main"
    ln -sf "$(realpath $SCRIPTDIR/r2panels/debug)" "$HOME/.local/share/radare2/r2panels/debug"
}

setup_radare2_ghidra() {
    r2pm update
    r2pm -ci r2ghidra
}

setup_pwndbg() {
    sudo apt install gdb -y
    git clone https://github.com/pwndbg/pwndbg
    cd pwndbg
    ./setup.sh
    cd ..
}

setup_pwndbg_ghidra() {
    python3 -m pip install r2pipe
}

main "$@"
