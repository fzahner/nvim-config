return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 40,
				side = "left",
				relativenumber = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
		})
	end,
}
