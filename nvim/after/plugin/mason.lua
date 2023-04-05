require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = {
        "elixirls",
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "pyright",
        "tsserver",
        "yamlls",
        "jsonls",
        "lemminx",
        "zls"
    },
})
