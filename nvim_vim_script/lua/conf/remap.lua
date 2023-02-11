vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- quit file
vim.keymap.set("n", "<leader>q", ":q!<CR>")
vim.keymap.set("n", "<leader>w", ":w!<CR>")

-- Use CTRL-L instead of <Esc> for relevant modes
vim.keymap.set("i", "<c-l>", "<esc>")
vim.keymap.set("x", "<c-l>", "<esc>")
vim.keymap.set("t", "<C-\\><C-n>", "<esc>")

vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<c-h>", "<c-w>h")

-- Register mapping
vim.keymap.set("v", "<leader>pp", "_dP")

-- non-US keyboard makes it hard to type [ and ].
vim.keymap.set("n", "<", "[")
vim.keymap.set("n", ">", "]")
vim.keymap.set("o", "<", "[")
vim.keymap.set("o", ">", "]")
vim.keymap.set("x", "<", "[")
vim.keymap.set("x", ">", "]")

-- Navigate quickfix list with ease
vim.keymap.set("n", "[p", ":cprevious<CR>")
vim.keymap.set("n", "[n", ":cnext<CR>")

vim.keymap.set("n", "<leader>ce", ":cexpr []<cr>")

-- Diagnostics
vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<leader>cd", ":lua vim.diagnostic.setqflist()<CR>")

-- Jumplist fix. Since <Tab> is going to be used for indentation, we need to remap <C-i>
vim.keymap.set("n", "<C-n>", "<C-i>")

-- Fix indentaion mapping
vim.keymap.set("n", "<Tab>", ">>_")
vim.keymap.set("v", "<Tab>", ">")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("v", "<S-Tab>", "<<")
vim.keymap.set("i", "<S-Tab>", "<C-d>")

-- Height:
vim.keymap.set("n", "<Leader>+", ':exe "resize " . (winheight(0) * 3/2)<CR>', { silent = true })
vim.keymap.set("n", "<Leader>-", ':exe "resize " . (winheight(0) * 2/3)<CR>', { silent = true })

-- move around between tabs:
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "5gt")
vim.keymap.set("n", "<leader>7", "5gt")
vim.keymap.set("n", "<leader>8", "5gt")
vim.keymap.set("n", "<leader>9", "5gt")
-- open and close:
vim.keymap.set("n", "<leader>to", ":tabnew%<CR>")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")

-- Move lines up and down
vim.keymap.set("v", "<c-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<c-k>", ":m '<-2<CR>gv=gv")
