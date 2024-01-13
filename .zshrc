export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U compinit
compinit -i

fpath=($HOME/.zsh $fpath)


HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000000000
SAVEHIST=100000000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

source "$HOME/cli/powerlevel10k/powerlevel10k.zsh-theme"

export PATH="$PATH:$HOME/bin:$HOME/cli/space/bin:$HOME/.local/bin:$HOME/Library/Python/3.11/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export WORKLOG_DIR=$HOME/drawer
export CURR_WORKLOG_DIR=$WORKLOG_DIR/$(date +%Y)/$(date +%m)/$(date +%d)
export CURR_WORKLOG_MONTH_DIR=$WORKLOG_DIR/$(date +%Y)/$(date +%m)

mkdir -p "$CURR_WORKLOG_DIR"

touch "$CURR_WORKLOG_DIR/today.log"
alias worklog="code $CURR_WORKLOG_MONTH_DIR"

move_to_drawer() {
    if [ $# -ne 0 ]
    then
        mv "$@" "$CURR_WORKLOG_DIR"
    fi

    cd "$CURR_WORKLOG_DIR" || exit 1
}

alias td=move_to_drawer
alias ll='ls -lah'


# brew install zsh-history-substring-search
source "$HOME/cli/zsh-history-substring-search/zsh-history-substring-search.zsh"

export XDG_CONFIG_HOME="$HOME/.config"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/private/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/private/tmp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/private/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/private/tmp/google-cloud-sdk/completion.zsh.inc'; fi
