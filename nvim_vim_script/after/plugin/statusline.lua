-- SETUP STATUSLINE
local fn, cmd = vim.fn, vim.cmd

function my_statusline()
  local branch = fn.FugitiveHead()

  if branch and #branch > 0 then
    branch = ' '..branch
  end

  return '%f %m ('..branch..') %=%-14.(%l,%c%V%) %P'
end

cmd[[ set statusline=%!luaeval('my_statusline()') ]]
