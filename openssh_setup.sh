main() {
    setup_openssh
}

setup_openssh() {
    sudo apt-get install openssh-server -y
    sudo systemctl enable ssh --now
    sudo systemctl start ssh
}

main "$@"
