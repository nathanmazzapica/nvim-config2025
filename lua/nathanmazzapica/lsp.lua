-- 1. Setup Lazydev FIRST (Must happen before LSP config)
-- This fixes the "Undefined global 'vim'" warning
require("lazydev").setup({
    library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})

-- 2. Setup Blink (Autocompletion)
require('blink.cmp').setup({
    keymap = { preset = 'default' }, -- Use 'super-tab' if you want Tab to accept
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = { enabled = true },
})

-- 3. Get Capabilities (Tell LSP that Blink is handling completion)
local capabilities = require('blink.cmp').get_lsp_capabilities()
--local lspconfig = require('lspconfig')

--local lspconfig = vim.lsp.config('lspconfig')

-- 4. Setup Languages

-- Lua

--lspconfig.lua_ls.setup({
--  capabilities = capabilities,
--})

--lspconfig.gopls.setup({
--  capabilities = capabilities,
--})

-- 5. Configure Diagnostics (The error text)
vim.diagnostic.config({
    virtual_text = true,      -- Shows text at end of line
    signs = true,             -- Shows icons in the gutter
    underline = true,
    update_in_insert = false, -- Wait until you stop typing to show errors
})

-- 6. Keybindings (Run only when an LSP attaches to a buffer)
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- Helper function to make mappings easier
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
        end

        -- The "Essentials"
        map('gd', vim.lsp.buf.definition, '[G]o to [D]efinition')
        map('gr', vim.lsp.buf.references, '[G]o to [R]eferences')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Optional: Auto-format on save
        -- (This uses the formatting code from your screenshot)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
    end,
})
