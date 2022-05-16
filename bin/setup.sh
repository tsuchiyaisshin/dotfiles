#!/bin/sh

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install mariadb-connector-c #
brew install fzf
brew install ripgrep

# fzf
[ -f ~/.fzf.zsh ] && .source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

DOT_FILES=()
DOT_FILES=(${DOT_FILES[@]} .gitconfig)
DOT_FILES=(${DOT_FILES[@]} .gitignore_global)
DOT_FILES=(${DOT_FILES[@]} .zprofile)
DOT_FILES=(${DOT_FILES[@]} .zshenv)
DOT_FILES=(${DOT_FILES[@]} .zshrc)
for file in ${DOT_FILES[@]}
do
  rm "$HOME/$file"
  ln -s "$HOME/dotfiles/$file $HOME/$file" .
done
