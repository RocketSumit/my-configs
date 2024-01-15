UID := $(id -u)

mac:
	brew install curl git autojump tmux

ubuntu:
	sudo apt install curl autojump git zsh vim tmux flameshot

setup:
	bash setup.sh

