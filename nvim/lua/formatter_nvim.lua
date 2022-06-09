require('formatter').setup {
  -- Will pick formatters from defaults.
  filetype = {
    go = {
        require('formatter.filetypes.go').gofmt,
    },
    python = {
        require('formatter.filetypes.python').autopep8,
    },
    json = {
        require('formatter.filetypes.json').fixjson,
    },
  }
}
