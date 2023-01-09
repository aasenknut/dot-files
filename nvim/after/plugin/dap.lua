require'dap'
require'dapui'.setup()
require'dap-go'.setup {
  dap_configurations = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
}
vim.keymap.set("n", "<leader>db", function() require'dap'.toggle_breakpoint() end, { silent = true })
vim.keymap.set("n", "<leader>dc", function() require'dap'.clear_breakpoints() end, { silent = true })
vim.keymap.set("n", "<leader>dn", function() require'dap'.continue() end, { silent = true })
vim.keymap.set("n", "<leader>dr", function() require'dap'.repl.toggle() end, { silent = true })
vim.keymap.set("n", "<leader>td", function() require'dap-go'.debug_test() end, {silent = true})

-- Stop debugging:
vim.keymap.set('n', '<leader>ds', function() require"dap".terminate() end)

-- DAP ui
vim.keymap.set('n', '<leader>du', function() require'dapui'.toggle() end)
vim.keymap.set('n', '<leader>de', function() require'dapui'.eval() end)
