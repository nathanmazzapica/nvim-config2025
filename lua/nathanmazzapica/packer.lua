-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'


	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'folke/tokyonight.nvim'
	use 'rose-pine/neovim'
	use 'bluz71/vim-nightfly-colors'

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('neovim/nvim-lspconfig')

    use('stevearc/oil.nvim')
    use('nvim-mini/mini.icons')

    use {
        'folke/lazydev.nvim',
    }

    use {
      'saghen/blink.cmp',
      -- Build the plugin from source (requires Rust)
      run = 'cargo build --release',
      -- Essential dependency for snippets
      requires = 'rafamadriz/friendly-snippets',
      config = function()
        require('blink.cmp').setup({
          keymap = { preset = 'default' },

          appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
          },

          signature = { enabled = true },



          -- Default list of enabled providers defined so that you can extend it
          -- elsewhere in your config, without redefining it, due to `opts_extend`
          sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
          },
        })
      end
    }

end)
