return {
	{
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
			-- LSP Setup is handeled by mason-lspconfig handlers
		end,
	},
	{

		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "html", "rust_analyzer", "texlab", "ts_ls", "marksman", "harper_ls" }, -- all LSPs
				automatic_installation = true,
			})
			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,
				-- Next, you can provide a dedicated handler for specific servers.

				-- Texlab
				["texlab"] = function()
					lspconfig.texlab.setup({
						on_attach = function(client, bufnr)
							-- Optional: Configure keybindings or other settings for Texlab
							local bufopts = { noremap = true, silent = true, buffer = bufnr }
							vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
							-- Add more keymaps as needed
						end,
					})
				end,

				-- HTML
				["html"] = function()
					-- Enable snippet support in LSP
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities.textDocument.completion.completionItem.snippetSupport = true
					lspconfig.html.setup({
						capabilities = capabilities,
					})
				end,
			})
		end,
	},
}
