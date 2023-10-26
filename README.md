# Neovim

*Note*. Nvim stuff will be placed in `~/.local/share/nvim/`, this is also where the treesitter stuff will end up.

# Languages

## Dotnet
- Debugger: https://github.com/Samsung/netcoredbg

## Go
- Tools. 
    - `$ go install golang.org/x/tools/cmd/goimports@latest`
    - `$ go install golang.org/x/tools/gopls@latest`
    - `$ brew install golangci-lint`

## LSP
Remember to install typescript-language-server before running `:LspInstall tsserver`,
```
npm install -g typescript-language-server typescript
```
Same for pyright:
```
npm i -g pyright
```

## Formatting
Remember to install relevant formatters:
- Stylua (https://github.com/JohnnyMorganz/StyLua):
```
$ brew install rustup
$ rustup-init
$ cargo install stylua
```
- JSON (fixjson): `$ npm install -g fixjson`
- Python (autopep8): `$ pip install autopep8`
- Prettier: 
```
$ npm install --save-dev --save-exact prettier
$ echo {}> .prettierrc.json
```

# CLI Tools
- **Colima** (https://github.com/abiosoft/colima/). For docker.
    - Remember: 
        - `brew install docker && brew install docker-compose`
        - In `~/.docker/config.json` change `credsStore` to `credStore`
- **Visidata** (https://www.visidata.org/install/) (https://github.com/saulpw/visidata). Terminal interface for exploring tabular data.
- **git-delta** (https://dandavison.github.io/delta/installation.html) Language syntax highlighting with the same syntax-highlighting themes as bat+++.
- **abd** (https://httpd.apache.org/docs/2.4/programs/ab.html)
- **PMD** (https://formulae.brew.sh/formula/pmd) An extensible cross-language static code analyzer.

# Other stuff
**Nerd Fonts**. To get icons and stuff.
```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

**Lua.** 
With package manager and formatter.
```
$ brew update && brew install lua@5.1
```
