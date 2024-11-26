return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto", --'gruvbox_dark',
				globalstatus = true, -- define one global line instead of for each window
				always_divide_middle = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					"diagnostics",
				},
				lualine_c = {
					{
						-- Lsp server name .
						function()
							local no_msg = "󰗞" -- when no active lsp
							local yes_msg = "  "
							local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return no_msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return yes_msg .. client.name
								end
							end
							return no_msg
						end,
					},
					{ -- active linters
						function()
							local linters = require("lint").get_running()
							if #linters == 0 then
								return "󰦕"
							end
							return "󱉶 " .. table.concat(linters, ", ")
						end,
					},
					"filename",
				},
				lualine_x = {
					{
						"progress",
						icon = { " Please display", align = "right", color = { fg = "green" } },
						draw_empty = true,
						color = { fg = "#ffaa88", bg = "grey" },
					},
				},
				lualine_y = { "encoding", "fileformat", { "filetype", colored = false } },
				lualine_z = { "location" },
			},
			extensions = { "mason", "toggleterm", "trouble" },
		})
	end,
}
