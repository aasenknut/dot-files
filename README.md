# Neovim

*Note*. Vim-Plug will put stuff in, `~/.local/share/nvim/`, this is also where the treesitter stuff will end up.

### LSP
Remember to install typescript-language-server before running `:LspInstall tsserver`,
```
npm install -g typescript-language-server typescript
```
Same for pyright:
```
npm i -g pyright
```

### Formatting
Remember to install relevant formatters:
- Go (gofmt): Just install Go. `$ brew update && brew install golang`.
- JSON (fixjson): `$ npm install -g fixjson`
- Python (autopep8): `$ pip install autopep8`

# Terminal
Terminal of choice is iTerm2 (https://iterm2.com/) (https://formulae.brew.sh/cask/iterm2).


# CLI Tools
- **Visidata** (https://www.visidata.org/install/) (https://github.com/saulpw/visidata). Terminal interface for exploring tabular data.
- **fzf** (https://github.com/junegunn/fzf). Command line fuzzy finder.
- **ripgrep** (https://github.com/BurntSushi/ripgrep). Line oriented search tool for recursively searching for regex patterns.
- **tree** (https://formulae.brew.sh/formula/tree). Display directories as trees (with optional color/HTML output).
- **ranger** (https://formulae.brew.sh/formula/ranger) (https://github.com/ranger/ranger). Console file manager with VI key bindings.
- **bat** (https://github.com/sharkdp/bat). Supports syntax highlighting for a large number of programming and markup languages.

# Other stuff
**Nerd Fonts**. To get icons and stuff.
```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

**Node / npm**
Install Node (npm will be installed with Node):
```
brew install node
```

**Lua.** 
With package manager and formatter.
```
$ brew update && brew install lua@5.1
```

**Golang.**
With language server.
```
$ brew update && brew install go
$ go install golang.org/x/tools/gopls@latest
```

**Python.**
Version management with virtual environments.
```
$ brew update
$ brew install pyenv
$ brew install pyenv-virtualenv
```
