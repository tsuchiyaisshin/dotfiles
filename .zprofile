# --------
# Alias
# -------


# git
alias gc='git commit'
alias gl='git log'
alias gs='git status'
alias ga='git add'
alias gd='git diff'

# rails
alias rns='CORS_ALLOWED_ORIGINS=dynamic bin/rails s'
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


function right_prompt {
  local branch_name st branch_status
  if git rev-parse 2>/dev/null; then
    branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    st=`git status 2> /dev/null`
    # コンフリクトが起こった状態
    if [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
      branch_status="%U%F{red}"
      branch_name="CONFLICT"
    # 自動マージできないファイルがある状態
    elif [[ -n `echo "$st" | grep "^Unmerged paths"` ]]; then
      if [[ -n `echo "$st" | grep "Changes to be committed:"` ]]; then
        branch_status="%K{red}"
      else
        branch_status="%F{red}"
      fi
    # ステージングファイルがある場合
    elif [[ -n `echo "$st" | grep "Changes to be committed:"` ]]; then
      # 新規ファイル、リネーム、削除ファイルがある場合はマゼンタ塗りつぶし
      # ステージング部分の文字列のみ抽出し、そこに特定の文字が含まれているかどうか
      if [[ -n `echo "$st" | awk '/Changes to be committed:/,/(Changes not staged for commit:|Untracked files:)/' | grep -e "new file:" -e "deleted:" -e "renamed:"` ]]; then
        branch_status="%K{magenta}"
      else
        branch_status="%K{yellow}"
      fi
    # 変更はあるがステージングされていないファイルがある場合
    # 新規ファイル、リネーム、削除ファイルがある場合はマゼンタ
    elif [[ -n `echo "$st" | grep -e "Untracked files:" -e "deleted:"` ]]; then
      branch_status="%F{magenta}"
    elif [[ -n `echo "$st" | grep "modified"` ]]; then
      branch_status="%F{yellow}"
    # 全てcommitされてクリーンな状態
    elif [[ -n `echo "$st" | grep "^nothing to"` ]]; then
      # pushされていなければ塗りつぶし
	  # 下記コマンドではリモートにブランチが存在していない時にエラーを出すが、その場合はpushしていないこととして扱う
      if [[ -n `git log origin/"$branch_name".."$branch_name" 2>&1` ]]; then
        branch_status="%K{green}"
      else
        branch_status="%F{green}"
      fi
    # 上記以外の状態の場合
    else
      branch_status=""
    fi
    # ブランチ名を色付きで表示する
    RPROMPT="${branch_status}[$branch_name]%{$reset_color%}"
  else
    # git 管理されていないディレクトリは何も返さない
	RPROMPT="%{$fg[green]%}[%D{%m/%d} %*]%{$reset_color%}"
  fi
}
autoload -Uz add-zsh-hook
PERIOD=1 # 描画にやや負荷がかかるため1秒以内はキャッシュしたものを使う
add-zsh-hook periodic right_prompt


re-prompt() {
	zle .accept-line
	zle .reset-prompt
}
zle -N accept-line re-prompt
