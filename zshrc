[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Luke's config for the Zoomer Shell

# Enable colors
autoload -U colors && colors

# Completion
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete

zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Left prompt:
setopt PROMPT_PERCENT
setopt PROMPT_SUBST
PROMPT='%n@%m:%F{yellow}%25<..<%~%<< »%f '

# Right prompt:
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}●%f'
zstyle ':vcs_info:git:*' formats '%F{cyan}%b%f%c%u'
zstyle ':vcs_info:git:*' actionformats '%F{cyan}%b (%a)%f%c%u'

RPROMPT='$vcs_info_msg_0_'

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# For syntax highlighting. Should be put last in this file.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
