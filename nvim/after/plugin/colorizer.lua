require 'colorizer'.setup {
  'css';
  'javascript';
  html = {
    mode = 'foreground';
  }
}

vim.keymap.set("n", "<leader>ct", ":ColorizerToggle<CR>")
