[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Luke's config for the Zoomer Shell

# Enable colors
autoload -U colors && colors

# Completion
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# Prompt:
setopt PROMPT_PERCENT
setopt PROMPT_SUBST

# Right prompt:
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

zstyle ':vcs_info:*' formats '(%F{blue}%b%f)'

# Left prompt:
PROMPT='%F{green}%(5~|%-1~/…/%3~|%4~)%f$vcs_info_msg_0_ ▸ '
# vi mode (clashes with tmux keys)
bindkey -v
bindkey '^l' vi-cmd-mode
export KEYTIMEOUT=1


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# fzf defaults
export FZF_DEFAULT_OPTS="--height=60% --layout=reverse --info=inline --padding=1 --preview='bat --style numbers,changes --color=always {}'
    --bind \ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

# ripgrep config file
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

#bat set default theme:
export BAT_THEME="TwoDark"

#Pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#go env stuff (check with, e.g.: go env GOPATH)
export PATH="$HOME/go/bin:$PATH"

#brew to PATH
export PATH="$PATH:/opt/homebrew/bin/"

#bin (scripts and such)
export PATH="$PATH:$HOME/bin"

#java path
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/"

#set neovim as default editor (this is used by ranger)
export EDITOR=nvim
export VISUAL=nvim

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# For syntax highlighting. Should be put last in this file.
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/knut.aasen/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/knut.aasen/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/knut.aasen/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/knut.aasen/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
