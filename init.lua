require("nathanmazzapica")
require("nathanmazzapica.packer")
require("nathanmazzapica.lsp")
vim.lsp.enable('pyright')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
require("oil").setup()
require('mini.icons').setup()

vim.diagnostic.config({
    virtual_text = true,      -- Show the error message at the end of the line
    signs = true,             -- Show the signs in the gutter (like the 'W' you see)
    underline = true,         -- Underline the error in the code
    update_in_insert = false, -- Don't spam warnings while you are still typing
})


--vim.lsp.enable('golangci_lint_ls')
