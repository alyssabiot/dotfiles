ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Add ruby version on prompt (float right)
if [ -x "$(command -v rbenv)" ]; then RPS1='[$(ruby_prompt_info)]$EPS1'; fi

# Useful plugins for Rails development with Sublime Text
plugins=(git brew rbenv last-working-dir common-aliases zsh-syntax-highlighting history-substring-search)

# Load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
export PATH="./bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load it here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR=atom

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

function aws-role() {
        aws-resetrole
        eval $(assume-role $1) && export AWS_PROFILE=$1;
}
function aws-resetrole() {
        unset ASSUMED_ROLE AWS_ACCESS_KEY_ID AWS_SECRET_KEY AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_SECURITY_TOKEN AWS_PROFILE;
}
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"

export GOPRIVATE="github.com/jobteaser/*"
export PATH="$HOME/code/alyssabiot/service/utils:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# Load ASDF:
. $HOME/.asdf/asdf.sh

# Prevent "static declaration" errors on macOS Catalina when building erlang
# with asdf-erlang, which uses kerl under the hood.
# Options `-O2` and `-g` are kerl's defaults. We're just adding the `-W` one.
export CFLAGS="-O2 -g -Wno-error=implicit-function-declaration $CFLAGS"

# use vim keybinding in terminal
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kubernetes aliases
jt-prod-rails-c() {
  kubectl exec -it --context=prod.jt --namespace=jobteaser $(kubectl get pod --context=prod.jt --namespace=jobteaser -l release=jobteaser-develop,component=console -o name) -- /opt/service/bin/rails console
}

jt-dev-rails-c() {
kubectl exec -it --context=dev.jt --namespace=jobteaser $(kubectl get pod --context=dev.jt --namespace=jobteaser -l release=jobteaser-develop,component=console -o name) -- /bin/bash -c 'source /vault/secrets/secrets.rc; /opt/service/bin/rails console'
}

jt-dev-bash() {
kubectl exec -it --context=dev.jt --namespace=jobteaser $(kubectl get pod --context=dev.jt --namespace=jobteaser -l release=jobteaser-develop,component=console -o name) -- /bin/bash
}

# ADB (Android Debug Bridge)
export PATH="/Users/alyssa.biot/Library/Android/sdk/platform-tools:$PATH"
