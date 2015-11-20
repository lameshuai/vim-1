#!/bin/sh
echo "Need to wait a while"
sudo apt-get install -y vim exuberant-ctags python python-dev cmake build-essential subversion git tree gcc g++ flashplugin-installer
#compile clang and llvm
rm -rf ~/.vim
mv vim ~/.vim
tar jxvf ~/.vim/llvm.tar.bz2 -C ~/.vim
mkdir -p ~/.vim/build 
cd ~/.vim/build
cmake -G "Unix Makefiles" ../llvm
make
#install vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#BundleInstall
mv -f ~/.vim/vimrc ~/.vimrc
echo "BundleInstall" > ~/Temporary
echo "The installation completes automatically exits" >> ~/Temporary
vim ~/Temporary -c "BundleInstall" -c "q" -c "q"
rm ~/Temporary
#compile youcompleteme
mkdir -p ~/.vim/ycm_build
cd ~/.vim/ycm_build
cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=~/.vim/build/lib/libclang.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_core
make ycm_support_libs
mv -f ~/.vim/ycm_extra_conf.py ~/.ycm_extra_conf.py
#clean
rm -f ~/.vim/llvm.tar.bz2
rm -f ~/.vim/README.md
