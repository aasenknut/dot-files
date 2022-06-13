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

# CLI Tools

**Visidata** (https://www.visidata.org/install/) (https://github.com/saulpw/visidata)
Terminal interface for exploring tabular data.

**fzf** (https://github.com/junegunn/fzf)
Command line fuzzy finder.

**ripgrep** (https://github.com/BurntSushi/ripgrep)
Line oriented search tool for recursively searching for regex patterns.
