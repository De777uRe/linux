#!/usr/bin/bash

if [ $# -ne 1 ]; then
  echo "Please specify location of configuration repo"
else
  repo_path=$1
  
  echo Copying ~/.bash_aliases ...
  cp ~/.bash_aliases $1
  
  echo Copying ~/.functions ...
  cp ~/.functions $1

  echo Copying ~/.bashrc ...
  cp ~/.bashrc $1

  echo Copying .vimrc ...
  cp ~/.vimrc $1

  echo Copying .tmux.conf ...
  cp ~/.tmux.conf $1
fi
