-- Default configs at https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/defaults
return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")
		local defaults = require("formatter.defaults")

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the "lua" filetype
					require("formatter.filetypes.lua").stylua,

					-- You can also define your own configuration
					function()
						-- Supports conditional formatting
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end

						-- Full specification of configurations is down below and in Vim help files
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
	end,
}
