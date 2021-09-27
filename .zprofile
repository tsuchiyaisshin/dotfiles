# --------
# Alias
# -------


# git
alias gc='git commit'
alias gl='git log --graph --oneline --decorate'
alias gs='git status'
alias ga='git add'
alias gd='git diff'

# rails
alias rns='CORS_ALLOWED_ORIGINS=dynamic bin/rails s'
alias rnj='bin/rails jobs:work'
alias rbcop='bundle exec rubocop -a'

# overwrap
alias lf='ls -a -lF | grep -v /'

# fzf
alias fcd='cd $(exa -l | grep ^d | awk '\''{print $7}'\'' | fzf -m --preview "exa {}")'
alias fcda='cd $(exa -la | grep ^d | awk '\''{print $7}'\'' | fzf -m --preview "exa {}")'

alias fb='git checkout $(git branch -a | tr -d " " |fzf --prompt "CHECKOUT BRANCH>" --preview "git log --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g")'


#----
#git hack
#----

