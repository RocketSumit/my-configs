UID := $(id -u)

mac:
	brew install curl git autojump tmux

ubuntu:
	sudo apt install -y curl autojump git zsh vim tmux flameshot terminator fonts-firacode fonts-powerline

setup:
	bash setup.sh

