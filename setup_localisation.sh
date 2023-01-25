#!/bin/bash
# Sets up localisation

set -e

main() {
    read -p "What localisation option do you want? [kr/my] " -n 2 -r
    echo
    reply="${REPLY,,}"
    if [[ $reply =~ ^(my)$ ]]; then
        setup_my
    elif [[ $reply =~ ^(kr)$ ]]; then
        setup_kr
    else
        echo "Invalid localisation option"
    fi
}

setup_kr() {
    sudo localectl set-locale LC_TIME=en_US.utf-8
    sudo timedatectl set-timezone Asia/Seoul
}

setup_my() {
    sudo localectl set-locale LC_TIME=en_US.utf-8
    sudo timedatectl set-timezone Asia/Kuala_Lumpur
}

main "$@"
