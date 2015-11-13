#!/bin/sh
echo "Need to wait a while"
sudo apt-get install -y vim exuberant-ctags python python-dev cmake build-essential subversion git smbclient tree
#compile clang and llvm
rm -rf ~/.vim ; mkdir ~/.vim
git clone https://github.com/dudn/vim.git ~/.vim
mkdir -p ~/vim/build ; cd ~/vim/build

#install vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#BundleInstall
mv -f ~/.vim/vimrc ~/.vimrc
echo "BundleInstall" > Temporary
echo "The installation completes automatically exits" >> Temporary
vim Temporary -c "BundleInstall" -c "q" -c "q"
rm Temporary
mkdir -p ~/.vim/ycm_build
cd ~/.vim/ycm_build
cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=~/.vim/ . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_core
make ycm_support_libs
mv -f ~/.vim/ycm_extra_conf.py ~/.ycm_extra_conf.py
