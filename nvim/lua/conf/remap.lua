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
-- this is problematic since pop ups use the term mode :(
-- vim.keymap.set("t", "<c-j>", [[<C-\><C-n><C-w>h]])
-- vim.keymap.set("t", "<c-k>", [[<C-\><C-n><C-w>j]])
-- vim.keymap.set("t", "<c-l>", [[<C-\><C-n><C-w>k]])
-- vim.keymap.set("t", "<c-h>", [[<C-\><C-n><C-w>l]])


-- Register mapping
vim.keymap.set("v", "<leader>P", '"_dP')

-- non-US keyboard makes it hard to type [ and ].
vim.keymap.set("n", "<", "[", {remap = true})
vim.keymap.set("n", ">", "]", {remap = true})
vim.keymap.set("o", "<", "[", {remap = true})
vim.keymap.set("o", ">", "]", {remap = true})
vim.keymap.set("x", "<", "[", {remap = true})
vim.keymap.set("x", ">", "]", {remap = true})

-- Navigate quickfix list with ease
vim.keymap.set("n", "[p", ":cprevious<CR>zz", {silent = true})
vim.keymap.set("n", "[n", ":cnext<CR>zz", {silent = true})

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

-- Keep cursor in middle when jumping and searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Keep cursor in place
vim.keymap.set("n", "J", "mzJ`z")

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
