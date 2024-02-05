require("lspconfig").clangd.setup({})

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.max_width = opts.max_width or 80
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gm", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>ft", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            mode = "symbol_text", -- show only symbol annotations
        }),
    },
    mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-e>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert , count = 5}),
        ["<C-y>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert , count = 5}),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        -- Super-Tab like mapping
        ["<C-f>"] = cmp.mapping(function(fallback) -- f for "forward"
            if vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping(function(fallback) -- b for "backward"
            if vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end, { "i", "s" }),
    },
    preselect = cmp.PreselectMode.None,
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" }, -- For vsnip users.
        { name = "buffer" },
        { name = "path" },
    }),
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").pyright.setup({
    capabilities = capabilities,
})

require("lspconfig").jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

require("lspconfig").yamlls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

require("lspconfig").lemminx.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

require("lspconfig").tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- elixir
require("lspconfig").elixirls.setup({
    cmd = { "elixir-ls" },
    capabilities = capabilities,
    on_attach = on_attach,
})

-- zig
require("lspconfig").zls.setup({
    cmd = { "zls" },
    capabilities = capabilities,
    on_attach = on_attach,
})

-- templ -- for templating.
require("lspconfig").templ.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})


require("lspconfig").rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    settings = {
        ["rust-analyzer"] = {},
    },
})

require("lspconfig").racket_langserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

require("lspconfig").clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
})

require("lsp_signature").setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    hint_enable = false,
    handler_opts = {
        border = "rounded",
    },
})

--OMNISHARP
local omnisharp_bin = "/Users/knutaasen/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"
local pid = vim.fn.getpid()
require 'lspconfig'.omnisharp.setup {
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    },
    cmd = { "dotnet", omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
    capabilities = capabilities,
    on_attach = on_attach,
}
require("lspconfig").fsautocomplete.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
