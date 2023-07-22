local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		--null_ls.builtins.diagnostics.credo,
		null_ls.builtins.formatting.mix,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.prettier.with({
			filetypes = { "html", "css", "yaml", "markdown", "json" },
		}),
	},
})
