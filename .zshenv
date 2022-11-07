export PATH="/usr/local/opt/sbt@0.13/bin:$PATH"
export PATH=/usr/local/bin:$PATH

### anyenv
eval "$(anyenv init -)"

### java ###
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_271.jdk/COntents/Home
PATH=${JAVA_HOME}/bin:${PATH}:${PLAY_HOME}

### rubyenv ###
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### rails ###
export PATH="/Users/i.tsuchiya1116/.rbenv/shims/rails/bin:$PATH"

### flutter ###
export PATH="$PATH:/Users/i.tsuchiya1116/develop/flutter/bin"

### mysql ###
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export DYLD_LIBRARY_PATH="/usr/local/opt/mysql@5.7/:$DYLD_LIBRARY_PATH"

### openssl ###
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

### nvm ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### nodenv ###
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

. "$HOME/.cargo/env"
