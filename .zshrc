# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulujdk_8_21_0_2/
export PATH="${JAVA_HOME}/bin:${PATH}"
export PATH=${PATH}:~/bin
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

[ -z "$PS1" ] && return
export EDITOR=/usr/bin/vim
export PAGER="less"
export LC_COLLATE=C

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="biraMe"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode jsontools wd colored-man-pages colorize docker gradle cp brew)

source $ZSH/oh-my-zsh.sh
# User configuration


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function quote()
{
    WHO_COLOR="\e[0;33m"
    TEXT_COLOR="\e[0;35m"
    COLON_COLOR="\e[0;35m"
    END_COLOR="\e[m"
    Q=$(curl -s --connect-timeout 2 "http://www.quotationspage.com/random.php3" | iconv -c -f ISO-8859-1 -t UTF-8 | grep -m 1 "dt ")
    TXT=$(echo "$Q" | sed -e 's/<\/dt>.*//g' -e 's/.*html//g' -e 's/^[^a-zA-Z]*//' -e 's/<\/a..*$//g')
    W=$(echo "$Q" | sed -e 's/.*\/quotes\///g' -e 's/<.*//g' -e 's/.*">//g')
    if [ "$W" -a "$TXT" ]; then
      echo "${WHO_COLOR}${W}${COLON_COLOR}: ${TEXT_COLOR}“${TXT}”${END_COLOR}"
    else
        echo "OFFLINE!"
    fi
}
#quote
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.alias ]; then
    . ~/.alias
fi


export EDITOR=/usr/bin/vim
export PAGER="less"
export LC_COLLATE=C
function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

export LESS="-erX"

function linkHome(){
	ln -s config/$1 ~/$1
}
eval $(thefuck --alias)
alias f="fuck"


source ~/.iterm2_shell_integration.zsh




# Runs the start script, accepts arguments such as worksheets
# Example: `start worksheets`
alias start='cd ~/code/web-resources && git checkout master && git pull && ./start.sh'

# Get your computer's IP address
alias get:ip='ipconfig getifaddr en0 || ipconfig getifaddr en5'

# Copy your computer's IP address
alias copy:ip='echo -n $(get:ip) | pbcopy'

# Get the url to run your client in a VM
alias copy:ie='echo -n http://$(get:ip):9000 | pbcopy'

# Get the url to access mock writeback tables for local development
alias copy:writeback='echo -n http://$(get:ip):7777/wday/gcw/rest/mocks/tables | pbcopy'

# Create a workbook without having to run the Drive client locally
alias create:workbook='cd ~/code/cban-web-client/test/functional; SEL_URL=http://$(get:ip):9000 ./gradlew createWorkbook; cd ~/code/cban-web-client'

# Open IntelliJ from the command line and sets SEL_URL
alias idea='~/code/web-resources/scripts/launch-intellij.sh'

# Open Screen Sharing with the correct port to watch Selenium tests
alias vnc='~/code/cban-web-client/test/functional/start_grid.sh -v'




autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down




export DOCKER_IP=$(ipconfig getifaddr en0)
export SEL_URL="http://${DOCKER_IP}:8000"
export SEL_WORKDAY_USER='root'
export SEL_WORKDAY_PASS=''
