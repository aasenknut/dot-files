require("neo-tree").setup({
  window = {
    mappings = {
      ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
    }
  }
})

vim.keymap.set('n', '<leader>n', ':Neotree toggle<cr>')
