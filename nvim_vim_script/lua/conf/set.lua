vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.rnu = true
vim.opt.nu  = true
vim.opt.incsearch = true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.foldmethod = 'manual'
vim.opt.shiftwidth=4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.cmdheight = 2
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.nrformats:append({"alpha"})
vim.opt.list = true
vim.opt.clipboard="unnamedplus"
vim.o.completeopt="menu,menuone,noselect,noinsert"
