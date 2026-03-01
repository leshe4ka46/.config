# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions command-not-found)

source $ZSH/oh-my-zsh.sh
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

alias tp="curl -F 'tpaste=<-' https://tpaste.us/"

eval "$(atuin init zsh --disable-up-arrow)"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source ~/.zsh_git

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

POWERLEVEL9K_MODE="nerdfont-complete"
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias decode_url='perl -pe '\''s/\+/ /g;'\'' -e '\''s/%(..)/chr(hex($1))/eg;'\'' <<< '

compilerun() {
    if [[ -z "$1" ]]; then
        echo "Usage: compilerun <filename.c>"
        return 1
    fi

    local filename="$1"
    shift
    local temp_output="/tmp/$(basename "$filename" .c)_$(sha256sum $filename | awk '{print $1}')"
    if [[ -e "$temp_output" ]];then
        echo "Running allready compiled file $temp_output"
        time "$temp_output" $@
        return $?
    fi

    clang++ -g -fsanitize=address,undefined -std=gnu++23 -Wall -Wextra "$filename" -o "$temp_output" -lpthread -ltbb
    if [[ $? -eq 0 ]]; then
        time "$temp_output" $@
    else
        echo "Compilation failed."
    fi
}
alias ls=eza
alias l="eza -alhgb --icons"

function nano () {
  if [ ! -f "${@: -1}" ] || [ -w "${@: -1}" ]; then
    /bin/nano "$@"
  else
    echo -n "File is unwritable\nRun as root? (yes/no): "
    read choice
    case "$choice" in
      yes|y|Y|"") 
        sudo /bin/nano "$@"
        ;;
      no|n|N) 
        /bin/nano -v "$@"
        ;;
      *) 
        echo "Invalid choice. Running without root."
        /bin/nano -v "$@"
        ;;
    esac
  fi
}

zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//,/ }
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'


#alias hiddify="sudo hiddify > /dev/null 2>&1 & disown"

export XMODIFIERS=@im=fcitx

export QT_IM_MODULE=fcitx

export GTK_IM_MODULE=fcitx

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/alex/.dart-cli-completion/zsh-config.zsh ]] && . /home/alex/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

#export LD_LIBRARY_PATH="/home/alex/osmo-src/libasn1c/src/.libs/:/home/alex/osmo-src/libosmo-abis/src/.libs/:/home/alex/osmo-src/libosmocore/src/codec/.libs/:/home/alex/osmo-src/libosmocore/src/coding/.libs/:/home/alex/osmo-src/libosmocore/src/core/.libs/:/home/alex/osmo-src/libosmocore/src/ctrl/.libs/:/home/alex/osmo-src/libosmocore/src/gb/.libs/:/home/alex/osmo-src/libosmocore/src/gsm/.libs/:/home/alex/osmo-src/libosmocore/src/isdn/.libs/:/home/alex/osmo-src/libosmocore/src/sim/.libs/:/home/alex/osmo-src/libosmocore/src/usb/.libs/:/home/alex/osmo-src/libosmocore/src/vty/.libs/:/home/alex/osmo-src/libosmo-netif/src/.libs/:/home/alex/osmo-src/libosmo-sccp/src/.libs/:/home/alex/osmo-src/libosmo-sigtran/src/.libs/:/home/alex/osmo-src/libsmpp34/binaries/:/home/alex/osmo-src/osmo-ggsn/gtp/.libs/:/home/alex/osmo-src/osmo-hlr/src/gsupclient/.libs/:/home/alex/osmo-src/osmo-hlr/src/mslookup/.libs/:/home/alex/osmo-src/osmo-iuh/src/.libs/:/home/alex/osmo-src/osmo-iuh/src/.libs/:/home/alex/osmo-src/osmo-iuh/src/.libs/:/home/alex/osmo-src/osmo-iuh/src/.libs/:/home/alex/osmo-src/osmo-mgw/src/libosmo-mgcp-client/.libs/:/home/alex/osmo-src/libsmpp34/binaries/.libs/"

export GOPATH=$HOME/go
export GOROOT=/usr/lib/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


export PYTHONPATH=/usr/local/lib/python$(python --version | cut -d " " -f 2 | cut -d "." -f 1,2 )/site-packages

export CMAKE_POLICY_VERSION_MINIMUM=3.5
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
