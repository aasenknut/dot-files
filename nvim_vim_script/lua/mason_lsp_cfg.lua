require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
        "gopls",
        "typescript-language-server",
        "pyright",
	},
})
