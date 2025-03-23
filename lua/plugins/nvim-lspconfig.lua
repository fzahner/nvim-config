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
				ensure_installed = {
					"clangd",
					"html",
					"rust_analyzer",
					"texlab",
					"ts_ls",
					"marksman",
					"cssls",
					"pylsp", -- requires flake8 linter installed
					-- "sqls",

					-- Spellchecker
					"harper_ls",
					"textlsp",
				}, -- all LSPs
				automatic_installation = true,
			})
			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler
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

				-- CSS
				["cssls"] = function()
					-- Enable snippet support in LSP
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities.textDocument.completion.completionItem.snippetSupport = true

					require("lspconfig").cssls.setup({
						capabilities = capabilities,
					})
				end,

				-- Python
				["pylsp"] = function()
					require("lspconfig").pylsp.setup({
						settings = {
							pylsp = {
								configurationSources = { "flake8" },
								plugins = {
									pycodestyle = { enabled = false },
									pyflakes = { enabled = false },
									mccabe = { enabled = false },
									flake8 = { enabled = true },
								},
							},
						},
					})
				end,

				["ts_ls"] = function()
					local util = require("lspconfig.util")
					require("lspconfig").ts_ls.setup({
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = "/usr/local/lib/node_modules/@vue/typescript-plugin", -- or use a dummy path if installed locally
									languages = { "javascript", "typescript", "vue" },
								},
							},
						},
						filetypes = { "javascript", "typescript", "vue" },
					})
				end,
			})
		end,
	},
}
