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

zstyle ':vcs_info:*' formats ' (%b)'

# Left prompt:
PROMPT='%n%F{red}@%f%m:%F{yellow}%25<..<%~%<<%f$vcs_info_msg_0_ %F{green}»%f '

# vi mode (clashes with tmux keys)
bindkey -v
bindkey '^l' vi-cmd-mode
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# For syntax highlighting. Should be put last in this file.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
