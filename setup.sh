#!/bin/sh
echo "Need to wait a while"
sudo apt-get install -y vim  git python python-dev cmake build-essential gcc g++  
#install vundle
rm -rf ~/.vim
mv vim ~/.vim
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#BundleInstall
mv -f ~/.vim/vimrc ~/.vimrc
vim  -c "BundleInstall" -c "q" -c "q"
#compile clang and llvm
tar jxvf ~/.vim/llvm.tar.bz2 -C ~/.vim
mkdir -p ~/.vim/build 
cd ~/.vim/build
cmake -G "Unix Makefiles" ../llvm
make
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
