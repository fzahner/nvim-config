return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
        "hrsh7th/cmp-nvim-lsp",
        'saadparwaiz1/cmp_luasnip', 
	},
	config = function()
        local cmp = require('cmp')
        
        -- Autopairs https://github.com/windwp/nvim-autopairs?tab=readme-ov-file#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo        
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')        
        cmp.event:on(
          'confirm_done',
          cmp_autopairs.on_confirm_done()
        )

        cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              end,
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' }, -- For luasnip users.
            }, 
            {
              { name = 'buffer' },
            })

        })
        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
        --     capabilities = capabilities      
        -- }        
        
	end,
}
