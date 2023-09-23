#!/bin/bash

# Zsh installation
if [ -z "${ZSH}" ]; then 
    sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi 
# Plugin installations
if [ ! -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
fi
if [ ! -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-history-substring-search" ]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
fi
if [ ! -d "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
# symlink zsh
ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zshrc
echo "ZSH setup done"

# symlik neovim
nvimpath=${HOME}/.config/nvim
if [ ! -d ${nvimpath} ]; then mkdir -p $nvimpath; fi
ln -sf ${PWD}/nvim/init.vim $nvimpath/init.vim
ln -sf ${PWD}/nvim/plugged.vim $nvimpath/plugged.vim
ln -sf ${PWD}/nvim/coc-settings.json $nvimpath/coc-settings.json
echo "Neovim setup done"

# symlink tmux
ln -sf ${PWD}/tmux/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${PWD}/tmux/.tmux.conf.local ${HOME}/.tmux.conf.local
echo "TMUX setup done"

if [[ "$OSTYPE" == "linux"* ]]; then
    # symlink terminator
    if [ ! -d ${HOME}/.config/terminator ]; then
        mkdir -p ${HOME}/.config/terminator
    fi
    ln -sf ${PWD}/terminator/config ${HOME}/.config/terminator/config
    echo "Terminator setup done"
fi
