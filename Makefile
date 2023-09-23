UID := $(id -u)

setup-mac:
	brew install curl git autojump tmux

setup-ubuntu:
	sudo apt install curl autojump git zsh vim tmux

dev:
	if [[ "$$(OSTYPE)" == "darwin"* ]]; then \
		setup-mac; \
	else if [[ "$$(OSTYPE)" == "linux"* ]]; then \
		setup-ubuntu; \
	fi \
	bash setup.sh

