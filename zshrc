# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="ys"
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(git) # zsh-syntax-highlighting)

# Load zsh-syntax-highlighting.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-autosuggestions.
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/austin/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#compinit
#promptinit
#autoload -U colors && colors

#setopt prompt_subst
#. ~/git-prompt.sh
#export RPROMPT=$'$(__git_ps1 "%s")'

alias ls="ls -hlF --color=auto"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias grep='grep -E -n --color=auto'
alias du='du -ch'
alias df='df -h'
alias ra='ranger-cd'
alias :q='exit'

mkcd() { mkdir -p "$@" && cd "$@"; }

ranger-cd() {
    tempfile=$(mktemp /tmp/${tempfoo}.XXXXXX)
    ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# VI MODE KEYBINDINGS (ins mode)
#bindkey -M viins '^a'       beginning-of-line
#bindkey -M viins '^e'       end-of-line
#bindkey -M viins '^k'       kill-line
#bindkey -M viins '^r'       history-incremental-pattern-search-backward
#bindkey -M viins '^s'       history-incremental-pattern-search-forward
#bindkey -M viins '^p'       history-substring-search-up #up-line-or-history
#bindkey -M viins '^n'       history-substring-search-down #down-line-or-history
#bindkey -M viins '^f'       forward-char
#bindkey -M viins '^b'       backward-char
#bindkey -M viins '^y'       yank
#bindkey -M viins '^w'       backward-kill-word
#bindkey -M viins '^u'       backward-kill-line
#bindkey -M viins '^d'       delete-char
#bindkey -M viins '^h'       backward-delete-char
#bindkey -M viins '^?'       backward-delete-char
#bindkey -M viins '^_'       undo
#bindkey -M viins '^x^r'     redisplay
#bindkey -M viins '\eOH'     beginning-of-line # Home
#bindkey -M viins '\eOF'     end-of-line       # End
#bindkey -M viins '\e[2~'    overwrite-mode    # Insert
#bindkey -M viins '\ef'      forward-word      # Alt-f
#bindkey -M viins '\eb'      backward-word     # Alt-b
#bindkey -M viins '\ed'      kill-word         # Alt-d

# VI MODE KEYBINDINGS (cmd mode)
#bindkey -M vicmd 'k'        history-substring-search-up
#bindkey -M vicmd 'j'        history-substring-search-down
#bindkey -M vicmd '^a'       beginning-of-line
#bindkey -M vicmd '^e'       end-of-line
#bindkey -M vicmd '^k'       kill-line
#bindkey -M vicmd '^r'       history-incremental-pattern-search-backward
#bindkey -M vicmd '^s'       history-incremental-pattern-search-forward
#bindkey -M viins '^p'       history-substring-search-up #up-line-or-history
#bindkey -M viins '^n'       history-substring-search-down #down-line-or-history
#bindkey -M viins '^f'       forward-char
#bindkey -M viins '^b'       backward-char
#bindkey -M vicmd '^y'       yank
#bindkey -M vicmd '^w'       backward-kill-word
#bindkey -M vicmd '^u'       backward-kill-line
#bindkey -M viins '^d'       delete-char
#bindkey -M vicmd '/'        vi-history-search-forward
#bindkey -M vicmd '?'        vi-history-search-backward
#bindkey -M vicmd '^_'       undo
#bindkey -M vicmd '\ef'      forward-word                      # Alt-f
#bindkey -M vicmd '\eb'      backward-word                     # Alt-b
#bindkey -M vicmd '\ed'      kill-word                         # Alt-d
#bindkey -M vicmd '\e[5~'    history-beginning-search-backward # PageUp
#bindkey -M vicmd '\e[6~'    history-beginning-search-forward  #

# history-substring-search plugin configuration
#HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold'

# zsh-syntax-highlighting plugin configuration
#ZSH_HIGHLIGHT_STYLES[command]='bold'
#ZSH_HIGHLIGHT_STYLES[alias]='bold'
#ZSH_HIGHLIGHT_STYLES[builtin]='bold'
#ZSH_HIGHLIGHT_STYLES[function]='bold'
#ZSH_HIGHLIGHT_STYLES[precommand]='bold'
#ZSH_HIGHLIGHT_STYLES[path_approx]='none'

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab

