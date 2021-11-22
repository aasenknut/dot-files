require("lspconfig").pyright.setup{}
require("lspconfig").tsserver.setup{}
require("lspconfig").gopls.setup{
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}
