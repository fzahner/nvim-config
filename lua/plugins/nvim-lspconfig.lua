return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', opts = {} },
    },

    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.rust_analyzer.setup {
          -- Server-specific settings. See `:help lspconfig-setup`
          settings = {
            -- ['rust-analyzer'] = {},
          },
        }

    end,
    
}
