-- Debugging with Nvim-DAP.

local dap = require('dap')
local map = vim.keymap.set
map("n", "<leader>dn", ":lua require'dap'.continue()<CR>", {})
map("n", "<leader>dso", ":lua require'dap'.step_over()<CR>", {})
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", {})
map("n", "<leader>dsb", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {})
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", {})
map("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>", {})
map("n", "<leader>di", ":lua require'dap.ui.widgets'.hower()<CR>", {})
map("v", "<leader>di", ":lua require'dap.ui.widgets'.visual_hover()<CR>", {})

require('dap-go').setup('~/go/bin/dlv')
require('dapui').setup()


--require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
-- custom dap-python config:
--table.insert(require('dap').configurations.python, {
--  type = 'python',
--  request = 'launch',
--  name = 'My custom launch configuration',
--  program = '${file}',
--  cwd = vim.fn.getcwd(),
--})
