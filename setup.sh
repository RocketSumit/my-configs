#!/bin/bash

echo "Symlinking zsh ..."
# symlink zsh
ln -sf ${PWD}/ubuntu/zsh/.zshrc ${HOME}/.zshrc
echo "Symlinking zsh done"
# symlik neovim
echo "Symlinking neovim ..."
nvimpath=${HOME}/.config/nvim
if [ ! -d ${nvimpath} ]; then mkdir -p $nvimpath; fi
ln -sf ${PWD}/ubuntu/nvim/init.vim $nvimpath/init.vim
ln -sf ${PWD}/ubuntu/nvim/plugged.vim $nvimpath/plugged.vim
ln -sf ${PWD}/ubuntu/nvim/coc-settings.json $nvimpath/coc-settings.json
echo "Symlinking neovim done"
# symlink tmux
echo "Symlinking tmux .."
ln -sf ${PWD}/ubuntu/tmux/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${PWD}/ubuntu/tmux/.tmux.conf.local ${HOME}/.tmux.conf.local
echo "Symlinking tmux done"
# symlink terminator
echo "Symlinking terminator .."
if [ ! -d ${HOME}/.config/terminator ]; then mkdir -p ${HOME}/.config/terminator; fi
ln -sf ${PWD}/ubuntu/terminator/config ${HOME}/.config/terminator/config
echo "Symlinking terminator done"
