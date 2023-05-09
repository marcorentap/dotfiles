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
    sudo locale-gen en_US.UTF-8
    sudo update-locale LC_TIME=en_US.UTF-8
    sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
}

setup_my() {
    sudo locale-gen en_US.UTF-8
    sudo update-locale LC_TIME=en_US.UTF-8
    sudo ln -sf /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime
}

main "$@"
