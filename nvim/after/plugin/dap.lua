local dap = require'dap'
require'dapui'.setup()

-- go [START] --
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
-- go [END] --

-- dotnet [START] --
dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/local/bin/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}


vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input('Path to your *proj file', default_path, 'file')
    vim.g['dotnet_last_proj_path'] = path
    local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ✔️ ')
    else
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end

    return vim.g['dotnet_last_dll_path']
end

local config = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
            vim.g.dotnet_build_project()
        end
        return vim.g.dotnet_get_dll_path()
    end,
  },
}

dap.configurations.cs = config
dap.configurations.fsharp = config
-- dotnet [END] --

-- Keymaps
vim.keymap.set("n", "<leader>db", function() require'dap'.toggle_breakpoint() end, { silent = true })
vim.keymap.set("n", "<leader>dc", function() require'dap'.clear_breakpoints() end, { silent = true })
vim.keymap.set("n", "<leader>dn", function() require'dap'.continue() end, { silent = true })
vim.keymap.set("n", "<leader>dr", function() require'dap'.repl.toggle() end, { silent = true })
vim.keymap.set("n", "<leader>td", function() require'dap-go'.debug_test() end, {silent = true})

vim.keymap.set("n", "<leader>do", function() require'dap'.step_over() end, { silent = true })
vim.keymap.set("n", "<leader>di", function() require'dap'.step_into() end, { silent = true })

-- Stop debugging:
vim.keymap.set('n', '<leader>ds', function() require"dap".terminate() end)

-- DAP ui
vim.keymap.set('n', '<leader>du', function() require'dapui'.toggle() end)
vim.keymap.set('n', '<leader>de', function() require'dapui'.eval() require'dapui'.eval() end)
