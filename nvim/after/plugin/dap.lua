require'dap'
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

--nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
--vnoremap <leader>di :lua require'dap.ui.widgets'.visual_hover()<CR>
