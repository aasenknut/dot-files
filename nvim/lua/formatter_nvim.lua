local formatter = require('formatter')
local prettierConfig = function()
  return {
    exe = "npx prettier",
    args = {
        "--stdin-filepath",
        vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        "--single-quote"
    },
    stdin = true
  }
end

local languageConfig = {
    go = {
        require('formatter.filetypes.go').gofmt,
    },
    python = {
        require('formatter.filetypes.python').autopep8,
    },
    json = {
        require('formatter.filetypes.json').fixjson,
    },
-- Can add the lines that follow for more advanced config for formatting certain files.
-- 
--    typescript = {
--        function()
--            return {
--                exe = "npx prettier",
--                args = {
--                    "--stdin-filepath",
--                    vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
--                    "--single-quote"
--                },
--                stdin = true
--            }
--        end
--    },
}

local prettierFormatters = {
  "css",
  "scss",
  "html",
  "java",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "markdown",
  "markdown.mdx",
  "json",
  "yaml",
  "xml",
  "svg"
}
for _, ft in ipairs(prettierFormatters) do
  languageConfig[ft] = {prettierConfig}
end

formatter.setup(
    {
        filetype = languageConfig
    }
)




