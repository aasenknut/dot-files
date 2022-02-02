local dap = require('dap')
--require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dapui').setup()
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-go').setup('~/go/bin/dlv')
-- custom dap-python config:
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'My custom launch configuration',
  program = '${workspaceFolder}/${file}',
  cwd = vim.fn.getcwd(),
})
