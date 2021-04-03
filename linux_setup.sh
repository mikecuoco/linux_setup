#!/bin/bash

cd $HOME 

# check if zsh is available, if not,  install
if ! command -v zsh
then 
  # install zsh
  mkdir services
  cd services
  wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
  mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
  cd zsh
  
  ./configure --prefix=$HOME/services
  make
  make install
  export PATH=$HOME/services/zsh/bin:$PATH
fi

# if oh-my-zsh is installed, if not, install
if ! [ -d "$HOME/.oh-my-zsh" ]
then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc
fi

# check for vundle installation
if ! [ -f "$HOME/.vim/bundle/Vundle.vim" ]
then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi