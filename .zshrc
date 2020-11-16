fpath=( "$HOME/.zfunctions" $fpath ) 

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate 

# Load antibody plugin manager https://getantibody.github.io/
source <(antibody init)
# Plugins
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions
antibody bundle marzocchi/zsh-notify
antibody bundle buonomo/yarn-completion

autoload -U promptinit; promptinit
# https://github.com/sindresorhus/pure
prompt pure

path=('/Users/heikki/bin' '/opt/local/bin' '/usr/local/go/bin' '/Users/heikki/source/go/bin' $path)
typeset -aU path

export PATH
# History settings (sharing and sizing)
export HISTSIZE=100000
export HISTFILESIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zhistory
export GOPATH='/Users/heikki/source/go'

setopt HIST_FIND_NO_DUPS

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

setopt inc_append_history
setopt share_history

DISABLE_AUTO_TITLE="true"
tt () {
    echo -e "\033];$@\007"
}

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH

export GOPATH=$HOME/project/go

export GRADLE_HOME=/opt/local/share/java/gradle
export PATH=$PATH:$GRADLE_HOME/bin

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Aliases
alias git_prune_branches='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias terminal-notifier='/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier'

alias dl='docker ps -l -q'

alias help='~/source/dotfiles/scripts/help.sh'
alias mem='~/source/dotfiles/scripts/memorize.sh'
alias fp='~/source/dotfiles/scripts/fp.sh'
alias svim='~/source/dotfiles/scripts/svim.sh'
alias fvim='~/source/dotfiles/scripts/fvim.sh'
alias kp='~/source/dotfiles/scripts/kp.sh'

# NVM Settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

