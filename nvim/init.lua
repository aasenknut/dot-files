require("conf")

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        --tpope
        "tpope/vim-sensible",
        "tpope/vim-surround",
        "tpope/vim-fugitive",
        --git (in addition to tpope's fugitive)
        "airblade/vim-gitgutter",
        --colours
        {
            "rebelot/kanagawa.nvim",
            lazy = false,    -- make sure we load this during startup if it is your main colorscheme
            priority = 1000, -- make sure to load this before all the other start plugins
            config = function()
                -- load the colorscheme here
                vim.cmd([[colorscheme kanagawa-dragon]])
            end,
        },
        --treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            build = function()
                local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
                ts_update()
            end,
        },
        --lsp (and related)
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "onsails/lspkind-nvim",
        "ray-x/lsp_signature.nvim",
        --symbols outline
        "hedyhli/outline.nvim",
        ---snippets
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "rafamadriz/friendly-snippets",
        ---fzf
        { "junegunn/fzf",         build = ":call fzf#install()" },
        "junegunn/fzf.vim",
        "gfanto/fzf-lsp.nvim",
        --ack
        "mileszs/ack.vim",
        --dap
        "mfussenegger/nvim-dap",
        { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
        --dap (language specific)
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
        --undo
        "mbbill/undotree",
        --maximizer
        "szw/vim-maximizer",
        --tree view
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
                "3rd/image.nvim",              -- image support in preview window
            }
        },
        --go
        "fatih/vim-go",
        {
            "rest-nvim/rest.nvim",
            dependencies = { { "nvim-lua/plenary.nvim" } },
            ft = 'http',
            config = function()
                require("rest-nvim").setup({
                })
            end
        },
        --csharp
        "Hoffs/omnisharp-extended-lsp.nvim",
    }
)
