-- Default configs at https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/defaults
return {
	{
		"mhartington/formatter.nvim",
		config = function()
			-- Utilities for creating configurations
			local util = require("formatter.util")
			local defaults = require("formatter.defaults")

			-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,

				-- All formatter configurations are opt-in
				filetype = {
					-- Formatter configurations for filetype "lua" go here and will be executed in order
					lua = {
						-- "formatter.filetypes.lua" defines default configurations for the "lua" filetype
						require("formatter.filetypes.lua").stylua,

						-- You can also define your own configuration
						function()
							return {
								exe = "stylua",
								args = {
									"--search-parent-directories",
									"--stdin-filepath",
									util.escape_path(util.get_current_buffer_file_path()),
									"--",
									"-",
								},
								stdin = true,
							}
						end,
					},

					tex = {
						function()
							return {
								exe = "latexindent",
								args = { "-m" },
								stdin = true,
							}
						end,
					},
					html = util.copyf(defaults.prettier),
					css = util.withl(defaults.prettier, "css"),
					javascript = util.copyf(defaults.prettier),
					json = util.copyf(defaults.prettier),
					markdown = util.copyf(defaults.prettier),
					typescript = util.withl(defaults.prettier, "typescript"),
					typescriptreact = util.withl(defaults.prettier, "typescript"),
					asm = {
						function()
							return {
								exe = "asmfmt",
								stdin = true,
							}
						end,
					},

					-- Use the special "*" filetype for defining formatter configurations on any filetype
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})
			-- Setup format on save
			local augroup = vim.api.nvim_create_augroup
			local autocmd = vim.api.nvim_create_autocmd
			augroup("__formatter__", { clear = true })
			autocmd("BufWritePost", {
				group = "__formatter__",
				command = ":FormatWrite",
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- as there is no mason-formatter bridge
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			-- Install Formatters
			require("mason-tool-installer").setup({
				ensure_installed = { "asmfmt", "latexindent", "prettier", "shfmt", "stylua" },
				run_on_start = true,
				start_delay = 3000,
				debounce_hours = 1,
			})
		end,
	},
}
