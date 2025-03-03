return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				routes = {
					{ -- Show save message in mini format
						filter = {
							event = "msg_show",
							kind = { "" },
							find = "written",
						},
						view = "mini",
					},
					{ -- Show undo message in mini format
						filter = {
							event = "msg_show",
							kind = { "" },
							find = "before #",
						},
						view = "mini",
					},
					{ -- Show undo message in mini format
						filter = {
							event = "msg_show",
							kind = { "" },
							find = "after #",
						},
						view = "mini",
					},
				},
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				views = {
					cmdline_popup = {
						position = {
							row = 5,
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
					},
					popupmenu = {
						enabled = true,
						backend = "cmp",
						relative = "editor",
						position = {
							row = 8,
							col = "50%",
						},
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
				},
			})

			require("lualine").setup({ -- Show @recording in status bar
				sections = {
					lualine_x = {
						{
							require("noice").api.statusline.mode.get,
							cond = require("noice").api.statusline.mode.has,
							color = { fg = "#ff9e64" },
						},
					},
				},
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				top_down = false,
			})
		end,
	},
}
