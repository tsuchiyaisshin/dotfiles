# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install mariadb-connector-c

#!/bin/sh

DOT_FILES=()
DOT_FILES=("${DOT_FILES[@]}" .gitconfig)
DOT_FILES=("${DOT_FILES[@]}" .gitignore_global)
DOT_FILES=("${DOT_FILES[@]}" .zprofile)
DOT_FILES=("${DOT_FILES[@]}" .zshenv)
DOT_FILES=("${DOT_FILES[@]}" .zshrc)
for file in ${DOT_FILES[@]}
do
  rm $HOME/$file
  ln -s $HOME/dotfiles/$file $HOME/$file
done
