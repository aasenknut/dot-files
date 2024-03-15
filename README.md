# Dot files

Just a set of random notes on local setup.

# Languages

- *Dotnet*
    - Debugger: https://github.com/Samsung/netcoredbg
- *Go*
    - Tools. 
        - `$ go install golang.org/x/tools/cmd/goimports@latest`
        - `$ go install golang.org/x/tools/gopls@latest`
        - `$ brew install golangci-lint`
- *Lua*
    - `$ brew install luajit`

# CLI Tools
- **Colima** (https://github.com/abiosoft/colima/). For docker.
    - Remember: 
        - `brew install docker && brew install docker-compose`
        - In `~/.docker/config.json` change `credsStore` to `credStore`
- **Visidata** (https://www.visidata.org/install/) (https://github.com/saulpw/visidata). Terminal interface for exploring tabular data.
- **git-delta** (https://dandavison.github.io/delta/installation.html) Language syntax highlighting with the same syntax-highlighting themes as bat+++.
- **ab** (https://httpd.apache.org/docs/2.4/programs/ab.html)
- **PMD** (https://formulae.brew.sh/formula/pmd) An extensible cross-language static code analyzer.

# Other stuff
**Nerd Fonts**. To get icons and stuff.
```
$ brew tap homebrew/cask-fonts
$ brew install --cask font-hack-nerd-font
```
