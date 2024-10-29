return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} },
	},

	config = function()
		local lspconfig = require("lspconfig")
		-- Rust analyzer
		lspconfig.rust_analyzer.setup({
			settings = {
				-- ['rust-analyzer'] = {},
			},
		})

		-- Texlab
		lspconfig.texlab.setup({
			on_attach = function(client, bufnr)
				-- Optional: Configure keybindings or other settings for Texlab
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				-- Add more keymaps as needed
			end,
		})

		-- HTML-LSP
		-- Enable snippet support in LSP
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		lspconfig.html.setup({
			capabilities = capabilities,
		})

        -- Javascript/Typescript
        lspconfig.ts_ls.setup({})
        
	end,
}
