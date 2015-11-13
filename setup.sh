#!/bin/sh
echo "Need to wait a while"
sudo apt-get install -y vim exuberant-ctags python python-dev cmake build-essential subversion git smbclient tree
cd ~
rm -rf ~/.vim ~/.vimrc
mkdir ~/.vim
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mv -f ~/vim/vimrc ~/.vimrc
mv -f ~/vim/ycm_extra_conf.py ~/.ycm_extra_conf.py
mv -f ~/vim/libclang.so ~/.vim/bundle &
echo "BundleInstall" > Temporary
echo "The installation completes automatically exits" >> Temporary
vim Temporary -c "BundleInstall" -c "q" -c "q"
rm Temporary
mkdir -p ~/ycm_build
cd ~/ycm_build
cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=~/.vim/bundle/libclang.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_core
make ycm_support_libs
